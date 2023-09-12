//
//  Order.swift
//  RUCafe_iOS
//
//  Created by kv on 8/17/23.
//

import Foundation

class Order: Identifiable{
    var id = UUID()
    static var currentOrderNumber = 0
    var orderNumber:Int
    var items: [any MenuItem] = []
    init(){
        Order.currentOrderNumber += 1
        orderNumber = Order.currentOrderNumber
    }
    
    // add item to order
    func addItem(item:any MenuItem){
        items.append(item)
    }
    // remove item from order
    func removeItem(item:any MenuItem){
        if let index = items.firstIndex(where: {$0.id == item.id}) {
                items.remove(at: index)
            }
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
//        let numberFormatter = NumberFormatter()
//            numberFormatter.numberStyle = .decimal
//            numberFormatter.minimumFractionDigits = 2
//            numberFormatter.maximumFractionDigits = 2
            
        var output = "Order #" + String(orderNumber) + ":\n"
            
        for item in items {
            output += item.toString() + "\n"
        }
        output+="Total: $" + String(format: "%.2f", getOrderPrice()+getOrderPrice()*0.06625)
        return output
    }
}
