//
//  ChartView.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var rentData = RentData()
    var body: some View {
        ZStack{
            Color(red:255/255, green: 231/255, blue: 230/255)
            .edgesIgnoringSafeArea(.all)

        VStack{
            PieChart(rentData: self.rentData).frame(width:300,height: 300)
            CircleChart(rentData: self.rentData).frame(width:300,height: 300)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
