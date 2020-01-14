//
//  TransactionCellModel.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation

final class TransactionCellModel {

    let id: Int
    let date: Date
    let description: String
    let amount: Double
    let fee: Double

    init(id: Int,
         date: Date,
         description: String,
         amount: Double,
         fee: Double) {
        self.id = id
        self.date = date
        self.description = description
        self.amount = amount
        self.fee = fee
    }
}
