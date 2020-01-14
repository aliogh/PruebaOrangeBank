//
//  TransactionCell.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var desc: UILabel!

    func bind(_ viewModel: TransactionCellModel) {
        desc.text = viewModel.description
        let totalAmount = viewModel.amount + viewModel.fee
        amount.text = "\(totalAmount.formatted2decimals) €"
        amount.textColor = getAmountColor(for: totalAmount)
        day.text = getDay(date: viewModel.date)
        month.text = getMonth(date: viewModel.date)
        year.text = getYear(date: viewModel.date)
    }

    private func getAmountColor(for amount: Double) -> UIColor? {
        if amount > 0 {
            return Constants.Color.green
        } else {
            return Constants.Color.red
        }
    }

    private func getMonth(date: Date) -> String {
        let month = NSCalendar.current.component(.month, from: date)
        let monthName = DateFormatter().monthSymbols?[month - 1].capitalized
        return String(monthName!.prefix(3)).uppercased()
    }

    private func getYear(date: Date) -> String {
        return String(NSCalendar.current.component(.year, from: date))
    }

    private func getDay(date: Date) -> String {
        return String(NSCalendar.current.component(.day, from: date))
    }

}
