//
//  RentRow.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct RentRow: View {
    var rent:Rent
    var body: some View {
        HStack {
            Text(rent.name)
            Spacer()
            Text("\(rent.money) 元\n\(rent.type)")

        }

    }
}

struct RentRow_Previews: PreviewProvider {
    static var previews: some View {
        RentRow(rent: Rent(name:"Wang",money:"150",type:"lunch"))
    }
}
