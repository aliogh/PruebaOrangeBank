//
//  TransactionsDataModel.swift
//  Data
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

//{
//  "id": 4734,
//  "date": "2018-07-11T22:49:24.000Z",
//  "amount": -193.38,
//  "fee": -3.18,
//  "description": "Lorem ipsum dolor sit amet"
//}

import Foundation
import Domain

struct TransactionsItemDataModel: Decodable {
    let id: Int?
    let date: String?
    let amount: Double?
    let fee: Double?
    let description: String?

    var domainModel: TransactionsItemDomainModel {
            return TransactionsItemDomainModel(id: id ?? 0,
            date: Date(fromISOString: date),
            amount: amount ?? 0,
            fee: fee ?? 0,
            description: description ?? "No description")
    }

}

struct TransactionsDataModel: Decodable {
    let items: [TransactionsItemDataModel]?
}

extension TransactionsDataModel {

    init(data: Data) throws {
        self.items = try JSONDecoder().decode([TransactionsItemDataModel].self, from: data)
    }

    var domainModel: TransactionsDomainModel {
        return TransactionsDomainModel(items: self.items?
            .filter { DateUtils.isStringISO($0.date!) == true }
            .map { $0.domainModel } ?? [])
    }

}
