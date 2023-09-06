//
//  donutsMenu.swift
//  RUCafe_iOS
//
//  Created by kv on 8/22/23.
//

import SwiftUI

let donutNumber = 3
let yeastNumber = 0
let cakeNumber = 1
let holeNumber = 2

struct donutsMenu: View {
    @State private var showToast = false
    @State var subtotal:Double=0
    @State var formattedValue:String="0.00"
    @State var donutList: [Donut] = []
    
    var body: some View {
        ZStack{
            Image(systemName: "squareshape.fill")
                .renderingMode(.template)
                .resizable(resizingMode: .stretch)
                .foregroundColor(Color(red: 0.675, green: 0.577, blue: 0.509))
                .ignoresSafeArea()
            VStack{
                Text("Subtotal: $" + formattedValue)
                    .font(.title)
                    .foregroundColor(Color(hue: 0.05, saturation: 0.96, brightness: 0.415))
                    .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                Spacer()
                List(donutList) { item in
                    VStack{
                        HStack {
                            Text(item.toString()).foregroundColor(Color(hue: 0.1, saturation: 0.96, brightness: 0.415))
                            Spacer()
                            Image(item.showImage())
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 10.0))
                                .frame(width: 100.0, height: 100.0)
                            
                        }
                        Button {
                            currentOrder.addItem(item: item)
                        } label: {
                            Text("Add to Order")
                        }.foregroundColor(Color.blue)

                    }.listRowBackground(Color(red: 0.675, green: 0.577, blue: 0.509))
                        }.listStyle(InsetListStyle())
                        .onAppear {
                            donutList = createDonutList()
                        }
                Spacer()
            }
        }
    }
}

// create a list of donuts with all every donut permutation
func createDonutList() -> [Donut]{
    var newDonutList:[Donut] = []
    var tempDonut = Donut(type: .YEAST)
    for donutType in 0...2{
        for flavor in tempDonut.getFlavors(){
            switch donutType{
                case yeastNumber:
                    tempDonut = Donut(type: .YEAST)
                    break
                case cakeNumber:
                    tempDonut = Donut(type: .CAKE)
                    break
                case holeNumber:
                    tempDonut = Donut(type: .HOLE)
                    break
            default: break
            }
            tempDonut.setFlavor(s: flavor)
            newDonutList.append(tempDonut)
        }
    }
    return newDonutList
}

struct donutsMenu_Previews: PreviewProvider {
    static var previews: some View {
        donutsMenu()
    }
}
