//
//  Home.swift
//  ListOfCurrencies
//
//  Created by Егор Даншов on 23/7/21.
//

import SwiftUI

struct Home: View {
    @ObservedObject var fetchDataVM = FetchDataVM()
    
    @State private var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if fetchDataVM.name.isEmpty {
                    Text("-empty")
                } else {
                    ForEach(0 ..< fetchDataVM.valueData.count) { id in
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(fetchDataVM.charCode[id])
                                    .font(.title)
                                    .fontWeight(.medium)

                                Text(fetchDataVM.name[id])
                                    .font(.subheadline)
                                    .lineLimit(8)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            Spacer()
                            
                            Text(fetchDataVM.value[id])
                                .font(.title)
                                .fontWeight(.medium)
                        }
                        .frame(height: 50)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    }
                }
            }
            .navigationTitle("List of Currencies")
            .toolbar {
                Button(action: {
                    fetchDataVM.reset()
                    fetchDataVM.fetchCurrency()
                    self.timeRemaining = 30
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .onAppear(perform: {
            print("1. onAppear inside contentview")
            fetchDataVM.fetchCurrency()
            
        })
        .onReceive(timer) { time in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                print(timeRemaining)
            } else {
                fetchDataVM.reset()
                fetchDataVM.fetchCurrency()
                self.timeRemaining = 30
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
