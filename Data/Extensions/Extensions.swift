//
//  Extensions.swift
//  Data
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation

extension Locale {

    struct LocaleIdentifiers {
        static let spanish: String = "es"
    }

    static let spanishLocale: Locale = {
        return Locale(identifier: LocaleIdentifiers.spanish)
    }()

    static func getLocale() -> Locale {
        let defaultLocale = Locale.spanishLocale
        return defaultLocale
    }

}

extension Encodable {

    var dictionary: [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: jsonData(), options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }

}
