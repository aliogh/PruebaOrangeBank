//
//  TransactionsDomainModel.swift
//  Domain
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation

public struct TransactionsDomainModel {
    public let items: [TransactionsItemDomainModel]

    public init(items: [TransactionsItemDomainModel]) {
        self.items = items
    }
}

public struct TransactionsItemDomainModel {
    public let id: Int
    public let date: Date
    public let amount: Double
    public let fee: Double
    public let description: String

    public init(id: Int,
                date: Date,
                amount: Double,
                fee: Double,
                description: String) {
        self.id = id
        self.date = date
        self.amount = amount
        self.fee = fee
        self.description = description
    }

}
