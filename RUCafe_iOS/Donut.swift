//
//  Donut.swift
//  RUCafe_iOS
//
//  Created by kv on 8/28/23.
//

import Foundation

enum types: CaseIterable{
    case YEAST, HOLE, CAKE
}

class Donut: MenuItem, Identifiable{
    var quantity: Int
    var id = UUID()
    var type:types
    var price:Double
    let yeastCost = 1.59
    let holeCost = 0.39
    let cakeCost = 1.79
    var flavor:String
    var potentialFlavors:[String] = [
        "Vanilla",
        "Chocolate",
        "Strawberry",
        "Banana",
        "Mint",
        "Caramel"
    ]
    init(flavor: String, type: types, price:Double) {
        self.quantity = 1
        self.flavor = flavor
        self.type = type
        switch type{
            case .CAKE:
                self.price = cakeCost
            case .HOLE:
                self.price = holeCost
            case .YEAST:
                self.price = yeastCost
        }
    }
    // sets flavor if it exists
    func setFlavor(s:String){
        for i in potentialFlavors{
            if s==i{
                flavor=i
            }
        }
    }
    // returns current flavor
    func getFlavor() -> String{
        return flavor
    }
    // sets quantity
    func setQuantity(i: Int) {
        self.quantity = i
    }
    // returns price based on type of donut
    func itemPrice() -> Double {
        switch type{
            case .CAKE:
                price = cakeCost
            case .HOLE:
                price = holeCost
            case .YEAST:
                price = yeastCost
        }
        return price
    }
    // convert donut object to string to send to orders list
    func toString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        var output = "x\(quantity): "
        output += flavor
        switch type{
            case .CAKE:
                output += " Cake Donut"
            case .HOLE:
                output += " Donut Hole"
            case .YEAST:
                output += " Yeast Donut"
        }
        let totalPrice = Double(quantity) * itemPrice()
        if let formattedPrice = numberFormatter.string(from: NSNumber(value: totalPrice)) {
                output += "\n $" + formattedPrice
            }
        return output
    }
    
}
