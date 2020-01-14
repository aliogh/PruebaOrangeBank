//
//  GetTransactionsUseCase.swift
//  Domain
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import RxSwift

public class GetTransactionsUseCase: BaseUseCase<TransactionsDomainModel>, BaseUseCaseProtocol {

    private var orangeBankRepository: OrangeBankRepository

    public init(orangeBankRepository: OrangeBankRepository) {
        self.orangeBankRepository = orangeBankRepository
    }

    internal override func handle() -> Observable<TransactionsDomainModel> {
        return orangeBankRepository
            .getTransactions()
            .flatMapLatest { transactionsDomainModel -> Observable<TransactionsDomainModel> in
                return Observable.just(transactionsDomainModel)
        }
    }

}
