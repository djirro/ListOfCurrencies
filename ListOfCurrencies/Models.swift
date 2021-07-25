//
//  Models.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import Foundation

class CurrenciesViewModel: ObservableObject {
    @Published var name: String = "-"
    @Published var value: Double = 0.00
    @Published var charCode: String = "-"
}
