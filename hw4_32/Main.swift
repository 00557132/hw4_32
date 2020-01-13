//
//  Main.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct Main: View {
    var body: some View {
            TabView{
                RentList()
                    .tabItem{
                        Image(systemName:"flag.fill")
                        Text("借款")
                    }
                ChartView(rentData:RentData())
                    .tabItem {
                          Image(systemName: "questionmark")
                          Text("圖表")
                    }
            }.accentColor(Color(red:242/255, green: 107/255, blue: 145/255))
        }
    }

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
