//
//  UtilsDomain.swift
//  Domain
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation

public class UtilsDomain {

    public static func getUrlBaseHost(protocolHost: String, host: String) -> String {
        return "\(protocolHost)\(host)"
    }

    // MARK: - Date Utils

    public static func getCurrentMonth() -> Int {
        return NSCalendar.current.component(.month, from: Date())
    }

    public static func getCurrentYear() -> Int {
        return NSCalendar.current.component(.year, from: Date())
    }

    public static func getMonthName(for month: Int) -> String? {
        return DateFormatter().monthSymbols?[month - 1].capitalized
    }

}
