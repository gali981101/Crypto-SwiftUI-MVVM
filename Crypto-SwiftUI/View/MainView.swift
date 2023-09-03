//
//  ContentView.swift
//  Crypto-SwiftUI
//
//  Created by Terry Jason on 2023/9/2.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel: CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List(cryptoListViewModel.cryptoList, id: \.id) {crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(crypto.price)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.toolbar(content: {
                Button {
                    Task.init {
                        cryptoListViewModel.cryptoList = [] // For Testing, not real
                        await cryptoListViewModel.downloadCryptoContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                } label: {
                    Text("Refresh")
                }
            })
            .navigationTitle(Text("Crypto"))
        }.task {
            await cryptoListViewModel.downloadCryptoContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            
//            await cryptoListViewModel.downloadCryptoAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
//        .onAppear {
//            cryptoListViewModel.downloadCrypto(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
