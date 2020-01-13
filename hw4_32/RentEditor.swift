//
//  RentEditor.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct RentEditor: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var money = "0"
    @State private var type = "早餐"
    var editRent: Rent?
    var rentData: RentData
    var body: some View {
        VStack{
            Form {
                TextField("名字", text: $name)
                TextField("金額", text: $money)
                .keyboardType(.numberPad)
                rentType(moneyType: self.$type)
                
            }
            .navigationBarTitle(editRent == nil ? "增加款項" : "編輯款項")
            .navigationBarItems(trailing: Button("儲存") {
                let rent = Rent(name: self.name,money: self.money,type: self.type)
               if let editRent = self.editRent {
                   let index = self.rentData.rents.firstIndex {
                   return $0.id == editRent.id
               }!
               self.rentData.rents[index] = rent
               } else {
                   self.rentData.rents.insert(rent, at: 0)
               }
               self.presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                if let editRent = self.editRent{
                    self.name = editRent.name
                    self.money = editRent.money
                    self.type = editRent.type
                    
                }
            }

        }
        .padding(.top)
        .foregroundColor(Color(red:105/255, green: 107/255, blue: 242/255))
        .colorMultiply(Color(red:230/255, green: 231/255, blue: 255/255))
    }
}

struct RentEditor_Previews: PreviewProvider {
    static var previews: some View {
        RentEditor(rentData: RentData())
    }
}

struct rentType: View
{
    @Binding var moneyType: String
    var types = ["早餐", "午餐", "晚餐", "雜項", "還款"]
    var body: some View
    {
        Picker(selection: $moneyType, label: Text("類型"))
        {
            ForEach(types, id: \.self)
            {
                (type) in
                Text(type)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
