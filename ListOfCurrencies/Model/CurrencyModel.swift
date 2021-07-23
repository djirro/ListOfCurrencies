//
//  CurrencyModel.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import Foundation

struct CurrencyModel: Codable {
    let charCode: [String: Valute]
    
    enum CodingKeys: String, CodingKey {
        case charCode = "Valute"
    }
}

struct Valute: Codable {
    let name: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
    }
}
