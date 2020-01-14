//
//  HomeViewModel.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import Domain
import RxSwift

class HomeViewModel: BaseViewModel {

    private let navigator: HomeNavigatorProtocol
    private let getTransactionsUseCase: GetTransactionsUseCase
    private var state: HomeViewState

    init(navigator: HomeNavigatorProtocol,
         getTransactionsUseCase: GetTransactionsUseCase) {
        self.navigator = navigator
        self.getTransactionsUseCase = getTransactionsUseCase
        self.state = HomeViewState()
    }

    func onDidLoad() {

        //TODO: show loading

        self.getTransactionsUseCase.execute()
            .subscribe(onNext: { [weak self] transactionsDomainModel in
                let originalTransactions = transactionsDomainModel.items.map {
                    TransactionCellModel(id: $0.id,date: $0.date, description: $0.description, amount: $0.amount, fee: $0.fee)
                }
                self?.state.transactions = originalTransactions
                self?.delegate?.update(with: self!.state)
                }, onError: { [weak self] error in
                    //TODO: control errors
            })
            .disposed(by: disposeBag)
    }

}
