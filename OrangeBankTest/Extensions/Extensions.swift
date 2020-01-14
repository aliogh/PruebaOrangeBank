//
//  Extensions.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit

// MARK: - Double

extension Double {

    var formatted3decimals: String {
        return String(format: "%.3f", self)
    }

    var formatted2decimals: String {
        return String(format: "%.2f", self)
    }

    func formatted(numberOfDecimals decimals: Int) -> String {
        return String(format: "%.\(decimals)f", self)
    }

}

// MARK: - Date

extension Date {

    public init(month: Int, year: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        self = Calendar.current.date(from: dateComponents) ?? Date()
    }

    public init(fromISOString isoString: String?) {
        let dateFormatter = ISO8601DateFormatter()
        self = dateFormatter.date(from: isoString ?? "") ?? Date()
    }

//    public init(fromIncompleteISOString isoString: String?) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = Constants.Calendar.isoDateFormat
//        self = dateFormatter.date(from: isoString ?? "") ?? Date()
//    }
//
//    var simpleFormatString: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = Constants.Calendar.simpleDateFormat
//        return formatter.string(from: self)
//    }

    var isoString: String {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: self)
    }

//    var dotFormatString: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = Constants.Calendar.dotDateFormat
//        return formatter.string(from: self)
//    }

    var month: Int? {
        return Calendar.current.dateComponents([.month], from: self).month
    }

    func monthsUntilNow() -> Int? {
        return Calendar.current.dateComponents([.month], from: Date(), to: self).month
    }

}

// MARK: - UINavigationController

extension UINavigationController {

    func pushRootViewController(animated: Bool) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        window.rootViewController = self

        if animated {
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }
}

// MARK: - UIView

extension UIView {

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}

extension Array {
    func removingDuplicates<T: Hashable>(byKey key: (Element) -> T)  -> [Element] {
        var result = [Element]()
        var seen = Set<T>()
        for value in self {
            if seen.insert(key(value)).inserted {
                result.append(value)
            }
        }
        return result
    }
}
