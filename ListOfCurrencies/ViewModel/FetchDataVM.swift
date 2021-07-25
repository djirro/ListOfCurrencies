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
        print("a")
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
                    print("b")
                    let decodedData = try decoder.decode(CurrencyModel.self, from: data)
                    DispatchQueue.main.async {
                        print("c")
                        self.valueData = decodedData.valute.values.sorted{$0.charCode < $1.charCode}
                        self.valueData.forEach { key in
                            self.name.append(key.name)
                            self.value.append(String(format: "%.2f", key.value))
                            self.charCode.append(key.charCode)
                        }
                        
                        print(self.valueData.count)
                        print(self.name.count)
                        print(self.charCode.count)
                        print(self.value.count)
                    }
                    
                } catch {
                    print("Error! Something went wrong.")
                }
            } else {
                print("Error: \(error?.localizedDescription ?? "Неизвестная ошибка")")
            }
            
            
        }.resume()
    }
}

