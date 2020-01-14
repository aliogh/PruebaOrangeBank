//
//  DependencyInjector.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import Domain
import Data

final class DependencyInjector {

    static let shared = DependencyInjector()

    // MARK: - Repositories

    private func getOrangeBankRepository() -> OrangeBankRepository {
        return ApiOrangeBankRepository.shared(protocolHost: EnvironmentConstants.protocolHost, host: EnvironmentConstants.baseHost, validateCertificate: true)
    }

    // MARK: - Use Cases

    private func getTransactionUseCase() -> GetTransactionsUseCase {
        return GetTransactionsUseCase(orangeBankRepository: getOrangeBankRepository())
    }

    // MARK: - View Models
    // MARK: Splash

    func getSplashViewModel(navigator: HomeNavigator) -> SplashViewModel {
        return SplashViewModel(navigator: navigator)
    }

    // MARK: Home

    func getHomeViewModel(navigator: HomeNavigator) -> HomeViewModel {
        return HomeViewModel(navigator: navigator,
                             getTransactionsUseCase: getTransactionUseCase())
    }
}

