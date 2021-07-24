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
                VStack {
//                    Text(fetchDataVM.charCode[0])
//                    ForEach(0 ..< fetchDataVM.valueData.count) { vallet in
//                        HStack {
//                            Text(fetchDataVM.charCode[vallet])
//                        }
//                    }
                }
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
