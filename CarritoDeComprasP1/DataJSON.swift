//
//  DataJSON.swift
//  CarritoDeComprasP1
//
//  Created by Ruben Francisco Romero Aguado on 3/17/19.
//  Copyright © 2019 Ruben Francisco Romero Aguado. All rights reserved.
//

import Foundation

struct Results: Codable  {
    var resultCount : Int
    var results: [Products]
}

struct Products: Codable {
    var name: String
    var image: String
    var detail: String
    var description: String
    var price: Double
    //var age: Int
    //var city: String
}
struct Buy: Codable {
    var name: String
    var qty: Int
    var price: Double
}
//id
//name
//image
//detail
//description
//price
//---stock
