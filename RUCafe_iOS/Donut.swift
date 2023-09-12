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
    let donutImages:[String] = [
        "vanilla_yeast_donut",
        "yeast_chocolate_donut",
        "yeast_strawberry_donuts",
        "banana_yeast_donut",
        "mint_yeast_donut",
        "caramel_yeast_donut",
        
        "vanilla_cake_donut",
        "chocolate_cake_donut",
        "cake_strawberry_donuts",
        "banana_cake_donut",
        "mint_cake_donut",
        "caramel_cake_donut",
        
        "vanilla_donutholejpg",
        "chocolate_donuthole",
        "strawberry_donuthole",
        "banana_donuthole",
        "mint_donuthole",
        "caramel_donuthole",
    ]
    init(type: types) {
        self.quantity = 1
        self.flavor = potentialFlavors[0]
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
    // returns possible flavors
    func getFlavors() -> [String]{
        return potentialFlavors
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
    // return list of images
    func showImage() -> String{
        switch (type, flavor){
        case (.YEAST, potentialFlavors[0]):
            return donutImages[0]
        case (.YEAST, potentialFlavors[1]):
            return donutImages[1]
        case (.YEAST, potentialFlavors[2]):
            return donutImages[2]
        case (.YEAST, potentialFlavors[3]):
            return donutImages[3]
        case (.YEAST, potentialFlavors[4]):
            return donutImages[4]
        case (.YEAST, potentialFlavors[5]):
            return donutImages[5]
        case (.CAKE, potentialFlavors[0]):
            return donutImages[6]
        case (.CAKE, potentialFlavors[1]):
            return donutImages[7]
        case (.CAKE, potentialFlavors[2]):
            return donutImages[8]
        case (.CAKE, potentialFlavors[3]):
            return donutImages[9]
        case (.CAKE, potentialFlavors[4]):
            return donutImages[10]
        case (.CAKE, potentialFlavors[5]):
            return donutImages[11]
        case (.HOLE, potentialFlavors[0]):
            return donutImages[12]
        case (.HOLE, potentialFlavors[1]):
            return donutImages[13]
        case (.HOLE, potentialFlavors[2]):
            return donutImages[14]
        case (.HOLE, potentialFlavors[3]):
            return donutImages[15]
        case (.HOLE, potentialFlavors[4]):
            return donutImages[16]
        case (.HOLE, potentialFlavors[5]):
            return donutImages[17]
        case (_, _): break
        }
        return donutImages[0]
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
    // convert donut object to string for the list and toast in Donut menu
    func toStringDonutMenu() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        var output = ""
        switch type{
            case .CAKE:
                output += "Type: Cake"
            case .HOLE:
                output += "Type: Hole"
            case .YEAST:
                output += "Type: Yeast"
        }
        output +=  "\nFlavor: " + flavor
        let totalPrice = Double(quantity) * itemPrice()
        if let formattedPrice = numberFormatter.string(from: NSNumber(value: totalPrice)) {
                output += "\n $" + formattedPrice
            }
        return output
    }
    
}
