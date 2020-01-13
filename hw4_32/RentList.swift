//
//  RentList.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct RentList: View {
    @ObservedObject var rentData = RentData()
    @State private var showEditRent = false
    var body: some View {
        VStack{
        NavigationView {
            List {
                ForEach(rentData.rents) { (rent) in
                    NavigationLink(destination: RentEditor(
                        editRent:rent, rentData:self.rentData)) {
                            RentRow(rent:rent)}
                }
                .onDelete { (indexSet) in
                self.rentData.rents.remove(atOffsets: indexSet)}
                .onMove { (indexSet, index) in
                    self.rentData.rents.move(fromOffsets: indexSet, toOffset: index)
                }
            }
            .navigationBarTitle("款項列表")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                
                self.showEditRent = true
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                
            }))
                .sheet(isPresented: $showEditRent) {
                    NavigationView {
                         RentEditor(rentData: self.rentData)
                    }
                   
            }
        }
        .foregroundColor(Color(red:105/255, green: 107/255, blue: 242/255))
    }
    .colorMultiply(Color(red:230/255, green: 231/255, blue: 255/255))
    }
}

struct RentList_Previews: PreviewProvider {
    static var previews: some View {
        RentList()
    }
}
