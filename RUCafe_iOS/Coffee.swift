//
//  Coffee.swift
//  RUCafe_iOS
//
//  Created by kv on 8/15/23.
//

import Foundation

enum sizes: CaseIterable {
    case SHORT,TALL,GRANDE,VENTI
}
class Coffee: MenuItem, Identifiable{
    var id = UUID()
    var quantity: Int
    let ORIGINAL_PRICE = 1.89
    let SIZE_INTERVAL = 0.40
    let ADDON_COST = 0.3
    var Size:sizes
    var price:Double
    var currentAddons: [String] = []
    let addons:[String] = ["French Vanilla",
                           "Sweet Cream",
                           "Irish Cream",
                           "Caramel",
                           "Mocha"]
    init(){
        self.price=ORIGINAL_PRICE
        self.Size = sizes.SHORT
        self.quantity = 1
    }
    // sets quantity
    func setQuantity(i: Int) {
        self.quantity = i
    }
    // method for the button that allows the user to add addons to the coffee when pressed
    func addAddon(newAddon:String){
        for curAddon in addons{
            if newAddon == curAddon && !currentAddons.contains(newAddon){
                currentAddons.append(newAddon)
            }
        }
    }
    // method for the button that allows the user to remove addons from the coffee when pressed
    func removeAddon(newAddon:String){
        if let index = currentAddons.firstIndex(of: newAddon) {
                currentAddons.remove(at: index)
            }
    }
    // changes size of the coffee
    func setSize(sizeEnum:sizes){
        Size=sizeEnum
    }
    // displays price of the coffee in the label box
    func itemPrice() -> Double {
        price = ORIGINAL_PRICE
        var i = 0
        for temp in sizes.allCases{
            if temp==Size{
                break
            }else{
                i+=1
            }
        }
        price+=Double(i)*SIZE_INTERVAL
        price+=Double(currentAddons.count)*ADDON_COST
        return price
    }
    
    // convert coffee object to string to send to orders list
    func toString() -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        var output = "x\(quantity): "
        switch Size {
            case .SHORT:
                output += "Short"
            case .TALL:
                output += "Tall"
            case .GRANDE:
                output += "Grande"
            case .VENTI:
                output += "Venti"
        }
            
        output += " Coffee"
            
        for s in currentAddons {
            output += "\n -" + s
        }
            
        let totalPrice = Double(quantity) * itemPrice()
        if let formattedPrice = numberFormatter.string(from: NSNumber(value: totalPrice)) {
                output += "\n $" + formattedPrice
            }
            
        return output
    }
}
