//
//  FetchDataVM.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import Foundation

class FetchDataVM: ObservableObject {
    @Published var valueData = [Valute]()
    @Published var name = [String]()
    @Published var value = [String]()
    @Published var charCode = [String]()
    
    func fetchCurrency() {
        let decoder = JSONDecoder()
        let session = URLSession.shared
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        
        guard let url = URL(string: urlString) else {
            print("Неверный формат ссылки")
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try decoder.decode(CurrencyModel.self, from: data)
                    DispatchQueue.main.async {
                        self.valueData = decodedData.valute.values.sorted{$0.charCode < $1.charCode}
                        self.valueData.forEach { key in
                            self.name.append(key.name)
                            self.value.append(String(format: "%.2f", key.value))
                            self.charCode.append(key.charCode)
                        }
                    }
                    
                } catch {
                    print("Error! Something went wrong.")
                }
            } else {
                print("Error: \(error?.localizedDescription ?? "Неизвестная ошибка")")
            }
            
            
        }.resume()
    }
    
    func reset() {
       valueData = [Valute]()
       name = [String]()
       value = [String]()
       charCode = [String]()
    }
}

