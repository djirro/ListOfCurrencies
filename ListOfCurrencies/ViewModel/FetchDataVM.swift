//
//  FetchDataVM.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import Foundation

class FetchDataVM: ObservableObject {
    @Published var valueData = [Valute]()
    
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
                        
                        //print(decodedData.valute)
                        self.valueData = decodedData.valute.values.sorted{$0.charCode < $1.charCode}
                        print(self.valueData)
                    } catch {
                        print("Error! Something went wrong.")
                    }
                }
            }
        }.resume()
    }
}

