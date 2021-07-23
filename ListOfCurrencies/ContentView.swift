//
//  ContentView.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 20/7/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var currenciesVM = CurrenciesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
//                    Text(currenciesVM.$name)
//                    Text(currenciesVM.$value)
//                    Text(currenciesVM.$charCode)
                }
            }
            .navigationTitle("List of Currencies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
