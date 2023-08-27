//
//  ordersMenu.swift
//  RUCafe_iOS
//
//  Created by kv on 8/17/23.
//

import SwiftUI

struct cartMenu: View {
    
//    @State var orderItems: [MenuItem] = []
//        var selecteditem:String
    @State var subtotal = 0
    @State var tax = 0
    @State var total = 0
//    init() {
//        self._orderItems = State(initialValue: currentOrder.getItems())
//    }
    @ViewBuilder
    func showList() -> some View{
        List {
            ForEach(currentOrder.getItems(), id: \.id) { item in
                Text(item.toString())
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
                    Text("Subtotal: $" + String(subtotal))
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.081, saturation: 0.694, brightness: 0.399))
                    Text("Sales Tax: $" + String(tax))
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.081, saturation: 0.694, brightness: 0.399))
                    Text("Total: $" + String(total))
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.081, saturation: 0.694, brightness: 0.399))
                }
                Spacer()
                    Button {
                        
                    } label: {
                        Text("Remove Selected Item").foregroundColor(Color.blue).font(.system(size: 35)).padding().background( LinearGradient(
                            colors: [.red, .yellow],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )).cornerRadius(40)
                    }
                
                Spacer()
                    Button {
                        
                    } label: {
                        Text("Add Order").foregroundColor(Color.red).font(.system(size: 35)).padding().background( LinearGradient(
                            colors: [.green, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )).cornerRadius(40)
                    }
                
            }
            
        }
        
    }
    
}



struct cartMenu_Previews: PreviewProvider {
    static var previews: some View {
        cartMenu()
    }
}
