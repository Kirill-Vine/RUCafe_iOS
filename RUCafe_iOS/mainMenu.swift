//
//  RUCafe_iOS
//
//  Created by kv on 8/10/23.
//

import SwiftUI

var currentOrder = Order()
var allOrders: [Order] = []
struct mainMenu: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image(systemName: "squareshape.fill")
                    .renderingMode(.template)
                    .resizable(resizingMode: .stretch)
                    .foregroundColor(Color.brown)
                    .ignoresSafeArea()
                VStack(spacing: 0.0) {
                    Text("RU")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.056, saturation: 1.0, brightness: 0.235))
                    Text("Cafe")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.056, saturation: 1.0, brightness: 0.235))
                    NavigationLink(destination: coffeeMenu()){
                            Image("coffee")
                                .resizable()
                                .aspectRatio(contentMode:
                                        .fit).clipShape(RoundedRectangle(cornerRadius: 10.0))
                                .padding([.top, .leading, .trailing], 20.0)
                    }
                    NavigationLink(destination: donutsMenu()){
                        Image("doughnut_menu")
                            .resizable()
                            .aspectRatio(contentMode:
                                    .fit).clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .padding([.top, .leading, .trailing], 10)
                    }
                    HStack() {
                        NavigationLink(destination: cartMenu()){
                            Image("cartMenu")
                                .resizable()
                                .aspectRatio(contentMode:
                                        .fit).clipShape(RoundedRectangle(cornerRadius: 10.0)).padding([.top, .leading, .bottom], 20.0)
                        }
                        
                        NavigationLink(destination: ordersMenu()){
                            Image("ordersMenu")
                                .resizable()
                                .aspectRatio(contentMode:
                                        .fit).clipShape(RoundedRectangle(cornerRadius: 10.0))
                                .padding([.top, .bottom, .trailing], 20.0)
                        }
                        
                    }
                    
                }
            }
        }
    }
}

struct mainMenu_Previews: PreviewProvider {
    static var previews: some View {
        mainMenu()
    }
}
