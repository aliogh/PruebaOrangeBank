//
//  ApiOrangeBankRepository.swift
//  Data
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import Domain
import Alamofire
import RxSwift

public final class ApiOrangeBankRepository: OrangeBankRepository {

    // MARK: - Variables

    private var validateCertificate: Bool
    private var host: String
    private var baseURL: String
    private var manager: Alamofire.SessionManager!

    // MARK: - Singleton

    private static var repositoryInstance: ApiOrangeBankRepository?

    public static func shared(protocolHost: String, host: String, validateCertificate: Bool = false) -> OrangeBankRepository {
        if let repositoryInstance = ApiOrangeBankRepository.repositoryInstance {
            return repositoryInstance
        } else {
            return ApiOrangeBankRepository(protocolHost: protocolHost, host: host, validateCertificate: validateCertificate)
        }
    }

    private init(protocolHost: String, host: String, validateCertificate: Bool) {
        self.host = host
        self.baseURL = UtilsDomain.getUrlBaseHost(protocolHost: protocolHost, host: host)
        self.validateCertificate = validateCertificate
        self.manager = getSessionManager(host: host, validateCertificate: validateCertificate)
    }

    private func getSessionManager(host: String, validateCertificate: Bool) -> Alamofire.SessionManager {
        if !validateCertificate {
            // Create the server trust policies
            let serverTrustPolicies: [String: ServerTrustPolicy] = [
                host: .disableEvaluation
            ]

            let manager = Alamofire.SessionManager(
                configuration: URLSessionConfiguration.default,
                serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
            )

            return manager
        } else {
            return Alamofire.SessionManager.default
        }
    }

    // MARK: - Transactions

    public func getTransactions() -> Observable<TransactionsDomainModel> {
        let urlString = baseURL + RepositoryConstants.ApiOrangeBank.Method.transactions
                return Observable.create { observer -> Disposable in
                    Alamofire
                        .request(urlString)
                        .validate()
                        .responseJSON { response in
                            switch response.result {
                            case .success(_):
                                do {
                                    if let data = response.data {
                                        observer.onNext(try TransactionsDataModel(data: data).domainModel)
                                    } else {
                                        observer.onError(RepositoryConstants.Exception.parseError)
                                    }
                                } catch {
                                    observer.onError(RepositoryConstants.Exception.parseError)
                                }
                                break
                            case .failure(let error):
                                observer.onError(self.getError(error, responseData: response.data))
                            }
                            observer.onCompleted()
                    }
                    return Disposables.create()
                    }
                    .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }

    // MARK: - Util functions

    private func getHeader(authorization: String, withContentType: Bool = false) -> [String: String] {
        if withContentType {
            return [
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Bearer \(authorization)"
            ]
        } else {
            return ["Authorization": "Bearer \(authorization)"]
        }
    }

    private func getError(_ error: Error? = nil, responseData: Data? = nil) -> Error {
        // Try parse error message before check AFError or NSUrlError

        guard let error = error else { return RepositoryConstants.Exception.unknownError }

        if let afError = error as? AFError {
            let responseCode = afError.responseCode ?? -1
            return RepositoryConstants.Exception.Http(rawValue: responseCode) ?? error
        } else {
            switch error._code {
            case NSURLErrorTimedOut:
                return RepositoryConstants.Exception.Http.timeoutError
            case NSURLErrorCannotFindHost:
                return RepositoryConstants.Exception.Http.cannotFindHostError
            case NSURLErrorCannotConnectToHost:
                return RepositoryConstants.Exception.Http.cannotConnectToHostError
            case NSURLErrorNetworkConnectionLost:
                return RepositoryConstants.Exception.Http.connectionLostError
            case NSURLErrorNotConnectedToInternet:
                return RepositoryConstants.Exception.Http.internetError
            case NSURLErrorBadServerResponse:
                return RepositoryConstants.Exception.Http.badServerResponseError
            case NSURLErrorAppTransportSecurityRequiresSecureConnection:
                return RepositoryConstants.Exception.Http.requiresSecureConnectionError
            default:
                return error
            }
        }
    }
}
