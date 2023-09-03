//
//  CryptoCurrency.swift
//  Crypto-SwiftUI
//
//  Created by Terry Jason on 2023/9/2.
//

import Foundation

struct CryptoCurrency: Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency: String
    let price: String
    
    private enum Codingkeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
