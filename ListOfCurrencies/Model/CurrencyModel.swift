//
//  CurrencyModel.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import Foundation

// MARK: - CurrencyModel
struct CurrencyModel: Codable {
    let valute: [String : Valute]

    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
    }
}

// MARK: - Valute
struct Valute: Codable {
    let charCode, name: String
    let value: Double

    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case name = "Name"
        case value = "Value"
    }
}


