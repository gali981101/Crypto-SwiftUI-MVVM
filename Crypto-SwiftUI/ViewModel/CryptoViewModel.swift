//
//  CryptoViewModel.swift
//  Crypto-SwiftUI
//
//  Created by Terry Jason on 2023/9/2.
//

import Foundation

@MainActor
class CryptoListViewModel: ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = Webservice()
    
    func downloadCryptoContinuation(url: URL) async {
        
        do {
            let cryptos = try await webservice.downloadCurrenciesContinuation(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
            
//            DispatchQueue.main.async {
//                self.cryptoList = cryptos.map(CryptoViewModel.init)
//            }
            
        } catch {
            print(error)
        }
        
    }
    
//    func downloadCryptoAsync(url: URL) async {
//        do {
//            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
//
//            DispatchQueue.main.async {
//                self.cryptoList = cryptos.map(CryptoViewModel.init)
//            }
//        } catch {
//            print(error)
//        }
//    }
    
    //    func downloadCrypto(url: URL) {
    //        webservice.downloadCurrencies(url: url) { [self] result in
    //            resultHandle(result: result)
    //        }
    //    }
    
}

struct CryptoViewModel {
    
    let crypto: CryptoCurrency
    
    var id: UUID? {
        crypto.id
    }
    
    var currency: String {
        crypto.currency
    }
    
    var price: String {
        crypto.price
    }
    
}


// MARK: Networking Func

extension CryptoListViewModel {
    
    //    private func resultHandle(result: Result<[CryptoCurrency]?, DownloaderError>) {
    //        switch result {
    //        case .failure(let error):
    //            print(error)
    //
    //        case .success(let cryptos):
    //            successHandle(cryptos: cryptos)
    //        }
    //    }
    //
    //    private func successHandle(cryptos: [CryptoCurrency]?) {
    //        if let cryptos = cryptos {
    //            DispatchQueue.main.async {
    //                self.cryptoList = cryptos.map(CryptoViewModel.init)
    //            }
    //        }
    //    }
    
    
    
}
