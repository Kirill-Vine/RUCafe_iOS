//
//  coffeeMenu.swift
//  RUCafe_iOS
//
//  Created by kv on 8/15/23.
//

import Foundation
import SwiftUI

var currentCoffee = Coffee()

struct coffeeMenu: View {
    @State private var showToast = false
    @State private var subtotal:Double=0
    @State private var formattedValue:String="0.00"
    @State private var checkListID = 5
    @State private var checkListData = [
        CheckListItem(id:0,title: "French Vanilla"),
        CheckListItem(id:1,title: "Sweet Cream"),
        CheckListItem(id:2,title: "Irish Cream"),
        CheckListItem(id:3,title: "Caramel"),
        CheckListItem(id:4,title: "Mocha")
        ]
    @State private var noOfCups = "1"
    @State private var sizeOfCup = "Short"
    var body: some View {
        ZStack{
            Image(systemName: "squareshape.fill")
                            .renderingMode(.template)
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(Color(red: 0.675, green: 0.577, blue: 0.509))
                            .ignoresSafeArea()
            VStack{
                Image("coffeeMenuLogo")
                    .resizable()
                    .aspectRatio(contentMode:
                            .fit)
                    .padding(.all)
                Spacer()
                HStack{
                    Menu {
                        Section() {
                                Button("1") {
                                    currentCoffee.setQuantity(i: 1)
                                    noOfCups = "1"
                                }
                                Button("2") {
                                    currentCoffee.setQuantity(i: 2)
                                    noOfCups = "2"
                                }
                                Button("3") {
                                    currentCoffee.setQuantity(i: 3)
                                    noOfCups = "3"
                                }
                                Button("4") {
                                    currentCoffee.setQuantity(i: 4)
                                    noOfCups = "4"
                                }
                                Button("5") {
                                    currentCoffee.setQuantity(i: 5)
                                    noOfCups = "5"
                                }
                            }
                    } label: {
                        Label("Number of cups: ", systemImage: "number")
                    }
                    .foregroundColor(Color(hue: 0.1, saturation: 0.96, brightness: 0.415))
                    Text(noOfCups)
                        .foregroundColor(Color(hue: 0.05, saturation: 0.96, brightness: 0.415))
                        .padding(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    Menu {
                        Section() {
                                Button("SHORT") {
                                    currentCoffee.setSize(sizeEnum: .SHORT)
                                    sizeOfCup = "Short"
                                }
                                Button("TALL") {
                                    currentCoffee.setSize(sizeEnum: .TALL)
                                    sizeOfCup = "Tall"
                                }
                                Button("GRANDE") {
                                    currentCoffee.setSize(sizeEnum: .GRANDE)
                                    sizeOfCup = "Grande"
                                }
                                Button("VENTI") {
                                    currentCoffee.setSize(sizeEnum: .VENTI)
                                    sizeOfCup = "Venti"
                                }
                            }
                    } label: {
                        Label("Size: ", systemImage: "cup.and.saucer.fill")
                    }
                    .foregroundColor(Color(hue: 0.1, saturation: 0.96, brightness: 0.415))
                    Text(sizeOfCup)
                        .foregroundColor(Color(hue: 0.05, saturation: 0.96, brightness: 0.415))
                        
                }
                
                    List(checkListData){ item in
                        CheckView(isChecked: item.isChecked, title: item.title)
                            .listRowBackground(Color(red: 0.675, green: 0.577, blue: 0.509))
                    }.padding(.top, 20.0)
                    .font(.title).listStyle(InsetListStyle())
                    
                Text("Subtotal: $" + formattedValue)
                    .font(.title)
                    .foregroundColor(Color(hue: 0.1, saturation: 0.96, brightness: 0.415))
                    .padding(.top)
                    
                Button {
                    currentOrder.addItem(item: currentCoffee)
                    showToast = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showToast = false
                                }
                            }
                    sizeOfCup = "Short"
                    noOfCups = "1"
                    currentCoffee = Coffee()
                    checkListData.removeAll()
                    checkListID+=5
                    checkListData.append(CheckListItem(id: checkListID-4, title: "French Vanilla"))
                    checkListData.append(CheckListItem(id: checkListID-3, title: "Sweet Cream"))
                    checkListData.append(CheckListItem(id: checkListID-2, title: "Irish Cream"))
                    checkListData.append(CheckListItem(id: checkListID-1, title: "Caramel"))
                    checkListData.append(CheckListItem(id: checkListID, title: "Mocha"))
                    if let lastItem = currentOrder.getItems().last {
                        subtotal += lastItem.itemPrice()*Double(lastItem.getQuantity())
                        formattedValue = String(format: "%.2f", subtotal)
                    }
                } label: {
                    Text("ADD TO ORDER")
                        .font(.title)
                }
                .padding(50.0)
                Spacer()
                
            }
            if showToast {
                if let lastItem = currentOrder.getItems().last {
                    coffeeToastView(message: "Coffee added \n" + lastItem.toString())
                }
            }
        }
    }
}
// checkbox struct
struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button{
            toggle()
            if isChecked{
                currentCoffee.addAddon(newAddon: title)
            }else{
                currentCoffee.removeAddon(newAddon: title)
            }
        } label:{
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(title)
            }.foregroundColor(Color(hue: 0.1, saturation: 0.96, brightness: 0.415))
        }

    }

}
// constructor for each checkbox in the list menu
struct CheckListItem:Identifiable{
    var id:Int
    var isChecked: Bool = false
    var title: String
}
// toast message showing current coffee
struct coffeeToastView: View {
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
struct coffeeMenu_Previews: PreviewProvider {
    static var previews: some View {
        coffeeMenu()
    }
}
