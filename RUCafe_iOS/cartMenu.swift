//
//  ordersMenu.swift
//  RUCafe_iOS
//
//  Created by kv on 8/17/23.
//

import SwiftUI

struct cartMenu: View {
    @State private var showToastAdd = false // toast for when order is added
    @State private var showToastRemove = false // toast for when item is removed
    @State private var restartFlag = false // trigger view restart
    @State private var subtotal:Double = 0
    @State private var tax:Double = 0
    @State private var total:Double = 0
    @State private var formattedSubtotalValue:String="0.00"
    @State private var formattedTaxValue:String="0.00"
    @State private var formattedTotalValue:String="0.00"
    @State private var selectedItem: (any MenuItem)? // highlighted item after click
    // shows list of items in the cart, each can be pressed and removed
    @ViewBuilder
    private func showList() -> some View{
        List{
            ForEach(currentOrder.getItems(), id: \.id) { item in
                Button {
                    selectedItem = item
                } label: {
                    Text(item.toString()).background(selectedItem?.id == item.id ? Color(red: 0.675, green: 0.577, blue: 0.509).opacity(0.8) : Color.clear)
                }.listRowBackground(Color.brown)

            }
        }.font(.title).listStyle(InsetListStyle())
    }
    
    var body: some View {
        ZStack{
            Image(systemName: "squareshape.fill")
                            .renderingMode(.template)
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color.brown)
                            .ignoresSafeArea()
            VStack(spacing: 0.0) {
                Text("Your Shopping Cart")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.092, saturation: 0.367, brightness: 0.957))
                Spacer()
                showList()
                Spacer()
                HStack{
                    Text("Subtotal: $" + String(formattedSubtotalValue))
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.081, saturation: 0.694, brightness: 0.399)).onAppear{
                            subtotal = currentOrder.getOrderPrice()
                            formattedSubtotalValue = String(format: "%.2f", subtotal)
                        }
                    Text("Sales Tax: $" + String(formattedTaxValue))
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.081, saturation: 0.694, brightness: 0.399)).onAppear{
                            tax = currentOrder.getOrderPrice()*0.06625
                            formattedTaxValue = String(format: "%.2f", tax)
                        }
                    Text("Total: $" + String(formattedTotalValue))
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.081, saturation: 0.694, brightness: 0.399)).onAppear{
                            total = currentOrder.getOrderPrice()+currentOrder.getOrderPrice()*0.06625
                            formattedTotalValue = String(format: "%.2f", total)
                        }
                }
                Spacer()
                    Button {
                        if !currentOrder.getItems().isEmpty && !(selectedItem==nil){
                            currentOrder.removeItem(item: selectedItem!)
                                showToastRemove = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        showToastRemove = false
                                    }
                                }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                selectedItem = nil
                            }
                        }
                        restartFlag.toggle() // Toggle the flag to trigger view update
                    } label: {
                        Text("Remove Selected Item").foregroundColor(Color(hue: 0.069, saturation: 0.351, brightness: 0.948)).font(.system(size: 30)).padding().background(Color(hue: 0.027, saturation: 0.941, brightness: 0.354)).cornerRadius(40)
                    }
                
                Spacer()
                    Button {
                        if !currentOrder.getItems().isEmpty{
                            allOrders.append(currentOrder)
                            showToastAdd = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showToastAdd = false
                                }
                            }
                            currentOrder = Order()
                            restartFlag.toggle() // Toggle the flag to trigger view update
                        }
                    } label: {
                        Text("\t\t\tAdd Order\t\t\t").foregroundColor(Color(hue: 0.069, saturation: 0.351, brightness: 0.948)).font(.system(size: 31.5)).padding().background(Color(hue: 0.383, saturation: 0.927, brightness: 0.301)).cornerRadius(40)
                    }
                
            }
            if restartFlag {
                EmptyView() // A placeholder view to change the view's identifier
            }
            if showToastAdd {
                    orderToastView(message: "Order successfully added!")
            }
            if showToastRemove {
                if !(selectedItem==nil){
                orderToastView(message: selectedItem!.toString() + " removed from order")
                }
            }
        }.id(restartFlag) // Change the view's identifier when restartFlag toggles
        
    }
    
}

// toast message showing current order or item removed
struct orderToastView: View {
    let message: String
    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .padding()
                .background(Color.gray.opacity(0.6))
                .foregroundColor(.white)
                .cornerRadius(10)
                .transition(.move(edge: .bottom))
        }
    }
}

struct cartMenu_Previews: PreviewProvider {
    static var previews: some View {
        cartMenu()
    }
}
