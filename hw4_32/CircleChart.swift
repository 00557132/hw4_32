//
//  CircleChart.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct CircleChart: View {
        var rentData : RentData
        var percentages : [Double]
        var degree : [CGFloat]
        var colors : [Color]
        var types = ["早餐", "午餐", "晚餐", "雜項", "還款"]
        var totalCount : Int = 0
        
        init(rentData : RentData){
        self.rentData = rentData
        if rentData.rents.count == 0{
            colors = [Color.white,Color.white,Color.white,Color.white,Color.white]
            percentages = [1.0]
            degree = [0.0,0.0,0.0,0.0,0.0]
        }
        else{
            percentages = [0.0,0.0,0.0,0.0,0.0]
            colors = [Color.blue,Color.red,Color.yellow,Color.green,Color.orange]
            for data in self.rentData.rents{
                totalCount += 1;
                for index in 0...4{
                    if(types[index] == data.type){
                        percentages[index] += 1
                    }
                }
            }
            for index in 0...4{
                percentages[index] /= Double(totalCount)
            }
            degree = [0.0,CGFloat(percentages[0])]
            for index in 2...4{
                degree.append(CGFloat(percentages[index-1]) + degree[index-1])
            }
        }
        }
        var body: some View {
            ZStack{
                ForEach(degree.indices){ (index) in
                circleView(index:index,degree:self.degree,colors: self.colors)
                }
                VStack{
                HStack{
                    Text("藍：早餐")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("紅：午餐")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Text("黃：晚餐")
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                HStack{
                    Text("綠：雜項")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    Text("橘：還款")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)

                }
                }
            }
            .frame(width :250,height: 250)
             
        }
    }

    struct CircleChart_Previews: PreviewProvider {
        static var previews: some View {
            CircleChart(rentData: RentData())
        }
    }

    struct circleView: View {
        var index : Int
        var degree : [CGFloat]
        var colors : [Color]
        var body: some View {
            VStack{
                if index == (self.degree.count-1){
                    Circle()
                        .trim(from: self.degree[index], to:1)
                        .stroke(self.colors[index],lineWidth: CGFloat(30))
                }
                else{
                    Circle()
                        .trim(from: self.degree[index], to:self.degree[index+1])
                        .stroke(self.colors[index],lineWidth: CGFloat(30))
                }
            }
        }
    }
