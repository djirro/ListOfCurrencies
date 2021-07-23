//
//  FetchDataVM.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import Foundation

class FetchDataVM: ObservableObject {
    var fetchedData = [String: [String: String]]()
    
    init() {
        fetchCurrency()
    }
    
    func fetchCurrency() {
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(CurrencyModel.self, from: data)
                        
                        print(decodedData.charCode.values[$0])
                        
                        
//                        print(decodedData.charCode)
//                        for key in decodedData.charCode {
//
//
//                                var valute = String(format: "%.2f", decodedData.charCode.values.valuee)
//                                self.fetchedData.updateValue([Double : String], forKey: key)
//
//
//                        }
//
                        

                    } catch {
                        print("Error! Something went wrong.")
                    }
                }
            }
        }.resume()
    }
}

