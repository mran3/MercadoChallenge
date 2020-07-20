//
//  Product.swift
//  MercadoChallenge
//
//  Created by troquer on 7/19/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import Foundation

struct ProductResponse: Codable {
    var results: [Product]
}

struct Product: Codable {
    var id: String = ""
    var title: String = ""
    var permalink: String = ""
    var price: UInt = 0
    var thumbnail: String = ""
    var condition: String = ""
    var sellerAddress: SellerAddress?
    var availableQuantity: Int = 0
    
    func formattedPrice()->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        let formattedPrice = formatter.string(from: NSNumber(value: self.price)) ?? "0"
        return "COP \(formattedPrice)"
    }
}

struct SellerAddress: Codable {
    var state: State?
}

struct State: Codable {
    var name: String = ""
}
