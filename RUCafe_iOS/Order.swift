//
//  Order.swift
//  RUCafe_iOS
//
//  Created by kv on 8/17/23.
//

import Foundation

class Order{
    var currentOrderNumber = 0
    var orderNumber:Int
    var orderPrice:Double = 0
    var items: [any MenuItem] = []
    init(){
        orderNumber = currentOrderNumber
        currentOrderNumber+=1
    }
    // add item to order
    func addItem(item:any MenuItem){
        items.append(item)
    }
    // remove item from order
    func removeItem(item:any MenuItem){
        // MenuItem cannot be removed by index
    }
    // dipslays price of the order
    func getOrderPrice() -> Double{
        var finalPrice:Double = 0
        for item:any MenuItem in items{
            finalPrice += item.itemPrice()*Double(item.getQuantity())
        }
        return finalPrice
    }
    // return items in the array of items
    func getItems() -> [any MenuItem]{
        return items
    }
    // convert order data to string
    func toString() -> String{
        let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
            
            var output = "Order #" + String(orderNumber + 1) + ":\n"
            
            for item in items {
                output += "\t" + item.toString() + "\n"
            }
            return output
    }
}
