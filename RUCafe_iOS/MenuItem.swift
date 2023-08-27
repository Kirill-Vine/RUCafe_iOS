//
//  MenuItem.swift
//  RUCafe_iOS
//  Class for MenuItem, parent class for Donut and Coffee classes
//  Created by kv on 8/15/23.
//

import Foundation

protocol MenuItem: Identifiable{
    var quantity:Int{get set}
    var id: UUID { get }
    func itemPrice() -> Double
    // sets quantity of items
    func setQuantity(i:Int)
    // displays quantity
    func getQuantity() -> Int
    // convert to string
    func toString() -> String
}

extension MenuItem{
    mutating func setQuantity(i:Int){
        quantity=i
    }
    func getQuantity() -> Int{
        return quantity
    }
}
