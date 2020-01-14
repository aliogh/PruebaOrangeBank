//
//  DateUtils.swift
//  Data
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation

public struct DateUtils {

    public static func dateFormatter(value: Date, stringFormatter: String, currentLocale: String = Locale.preferredLanguages[0]) -> String {

        var valueReturn: String = ""
        let dateFormatter = DateFormatter.instance

        dateFormatter.dateFormat = stringFormatter

        dateFormatter.locale = Locale.spanishLocale
        /* if currentLocale.contains(Constants.LocaleIdentifiers.german) {
         dateFormatter.locale = Locale.germanLocale
         } */

        valueReturn = dateFormatter.string(from: value)

        return valueReturn
    }

    public static func dateFormatter(value: String, stringFormatter: String, currentLocale: String = Locale.preferredLanguages[0]) -> Date {

        let dateFormatter = DateFormatter.instance

        dateFormatter.dateFormat = stringFormatter

        dateFormatter.locale = Locale.spanishLocale
        /* if currentLocale.contains(Constants.LocaleIdentifiers.german) {
         dateFormatter.locale = Locale.germanLocale
         } */

        return dateFormatter.date(from: value) ?? Date()
    }

    public static func isStringISO(_ isoString: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: isoString) != nil
    }

}

extension Date {
    public var millisecondsSince1970: Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    public init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }

    public init(fromISOString isoString: String?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self = dateFormatter.date(from: isoString ?? "") ?? Date()
    }

    public var isoString: String {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: self)
    }

    public var isoMonthDayString: String {
        let formater = DateFormatter()
        formater.dateFormat = "MM/dd/yyyy"
        return formater.string(from: self)
    }

    public var isoDayMonthString: String {
        let formater = DateFormatter()
        formater.dateFormat = "dd/MM/yyyy"
        return formater.string(from: self)
    }

}

extension DateFormatter {
    public static let instance: DateFormatter = {
        return DateFormatter()
    }()
}
