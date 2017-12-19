//
//  Currency.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 17.12.2017.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//
import ObjectMapper

fileprivate let idKey = "ID"
fileprivate let numKey = "NumCode"
fileprivate let charCodeKey = "CharCode"
fileprivate let nominalKey = "Nominal"
fileprivate let nameKey = "Name"
fileprivate let valueKey = "Value"
fileprivate let previousKey = "Previous"

struct Currency {
    let id: String
    let numCode: String
    let charCode: String
    let nominal: Int
    let name: String
    let value: Float
    let previous: Float
    
    var values: [String] {
        return ["Num code: " + numCode,
                "Char code: " + charCode,
                "Nominal: \(nominal)",
                "Value: \(value)",
                "Previous: \(previous)"]
    }
}

extension Currency: ImmutableMappable {
    init(map: Map) throws {
        id       = try map.value(idKey)
        numCode  = try map.value(numKey)
        charCode = try map.value(charCodeKey)
        nominal  = try map.value(nominalKey)
        name     = try map.value(nameKey)
        value    = try map.value(valueKey)
        previous = try map.value(previousKey)
    }
    
    mutating func mapping(map: Map) {
        id       >>> map[idKey]
        numCode  >>> map[numKey]
        charCode >>> map[charCodeKey]
        nominal  >>> map[nominalKey]
        name     >>> map[nameKey]
        value    >>> map[valueKey]
        previous >>> map[previousKey]
    }
}
