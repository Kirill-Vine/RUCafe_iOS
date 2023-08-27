//
//  checkBox.swift
//  RUCafe_iOS
//
//  Created by kv on 8/15/23.
//

import Foundation
import SwiftUI

struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(title)
            }

        }

    }

}
