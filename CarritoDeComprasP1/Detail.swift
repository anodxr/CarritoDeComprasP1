//
//  Detail.swift
//  CarritoDeComprasP1
//
//  Created by Ruben Francisco Romero Agaudo on 3/14/19.
//  Copyright © 2019 Ruben Francisco Romero Aguado. All rights reserved.
//

import Foundation
class Product {
    var name = String()
    var description = String()
    var detail = String()
    var imageName = String()
    var price = Double()
    func priceQty (quanty: Int) -> Double {
        let total: Double = price * Double(quanty)
        return total
    }
    init(){
        
    }
    init(name : String, description : String, detail : String, imageName : String, price : Double) {
        self.name = name
        self.description = description
        self.detail = detail
        self.imageName = imageName
        self.price = price
        
    }
}
