//
//  URLConstants.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 18.12.17.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import Foundation

enum URLConstants {
    static let dailyJson = "https://www.cbr-xml-daily.ru/daily_json.js"
    static let flags = "https://raw.githubusercontent.com/transferwise/currency-flags/master/src/flags/"
    
    static func flagUrl(forCountryByCode code: String) -> URL {
        let urlStr = URLConstants.flags + code.lowercased() + ".png"
        return URL(string: urlStr)!
    }
}
