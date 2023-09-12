//
//  ordersMenu.swift
//  RUCafe_iOS
//
//  Created by kv on 8/22/23.
//

import SwiftUI

struct ordersMenu: View {
    @State private var selectedItem: Order?
    @State private var restartFlag = false // trigger view restart
    @State private var orderToast = false
    // shows list of orders, each can be pressed and removed
    @ViewBuilder
    private func showList() -> some View{
        List{
            ForEach(allOrders) { item in
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
                Text("Store Orders")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.092, saturation: 0.367, brightness: 0.957))
                Spacer()
                showList()
                Spacer()
                Button {
                    if !allOrders.isEmpty && !(selectedItem==nil){
                        allOrders = allOrders.filter{$0.id != selectedItem?.id}
                        orderToast=true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                orderToast = false
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
                    Text("Remove Selected Order").foregroundColor(Color(hue: 0.069, saturation: 0.351, brightness: 0.948)).font(.system(size: 30)).padding().background(Color(hue: 0.027, saturation: 0.941, brightness: 0.354)).cornerRadius(40)
                }
                Spacer()
            }
            if restartFlag {
                EmptyView() // A placeholder view to change the view's identifier
            }
            if orderToast{
                chosenOrderToastView(message: "Order \(selectedItem?.orderNumber ?? 0) removed")
            }
        }.id(restartFlag) // Change the view's identifier when restartFlag toggles
    }
}

// toast message showing current order or item removed
struct chosenOrderToastView: View {
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

struct ordersMenu_Previews: PreviewProvider {
    static var previews: some View {
        ordersMenu()
    }
}
