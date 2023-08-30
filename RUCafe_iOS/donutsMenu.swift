//
//  donutsMenu.swift
//  RUCafe_iOS
//
//  Created by kv on 8/22/23.
//

import SwiftUI

struct donutsMenu: View {
    @State private var showToast = false
    @State var subtotal:Double=0
    @State var formattedValue:String="0.00"
    var body: some View {
        ZStack{
            Image(systemName: "squareshape.fill")
                .renderingMode(.template)
                .resizable(resizingMode: .stretch)
                .foregroundColor(Color(red: 0.675, green: 0.577, blue: 0.509))
                .ignoresSafeArea()
            VStack{
                Text("Subtotal: $" + formattedValue).foregroundColor(Color(hue: 0.05, saturation: 0.96, brightness: 0.415))
                    .padding(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
    }
}

struct donutsMenu_Previews: PreviewProvider {
    static var previews: some View {
        donutsMenu()
    }
}
