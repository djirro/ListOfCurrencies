//
//  Home.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import SwiftUI

struct Home: View {
    @ObservedObject var fetchDataVM = FetchDataVM()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
            .navigationTitle("List of Currencies")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
