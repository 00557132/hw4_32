//
//  PieChart.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//
import Foundation
import SwiftUI

struct PieChart: View {
        var rentData : RentData
        var percentages : [Double]
        var angles : [Angle]
        var types = ["早餐", "午餐", "晚餐", "雜項", "還款"]
        var colors :[Color]
        var totalCount : Int = 0
        
        init(rentData : RentData){
            self.rentData  = rentData
            if rentData.rents.count == 0{
                self.colors = [Color.white,Color.white,Color.white,Color.white,Color.white]
                self.percentages = [1.0]
                self.angles = [.degrees(0),.degrees(0),.degrees(0),.degrees(0),.degrees(0)]
            }
            else{
                percentages = [0.0,0.0,0.0,0.0,0.0]
                angles = [Angle]()
                colors = [Color.blue,Color.red,Color.yellow,Color.green,Color.orange]

                for data in self.rentData.rents{
                    totalCount += 1;
                    for index in 0...4{
                        if(types[index] == data.type){
                            percentages[index] += 1
                        }
                    }
                }
                var startDegree : Double = 0
                for index in 0...4{
                    percentages[index] /= Double(totalCount)
                    angles.append(.degrees(startDegree))
                    startDegree += 360 * percentages[index]
                }
            }
        }
        var body: some View {
            ZStack{
                ForEach(angles.indices){ (index) in
                    ExtractedView(index:index,angles: self.angles,colors: self.colors)
                }
            }
        }
    }

    struct PieChart_Previews: PreviewProvider {
        static var previews: some View {
            PieChart(rentData: RentData())
        }
    }


    struct ExtractedView: View {
        var index : Int
        var angles : [Angle]
        var colors : [Color]
        var body: some View {
            ZStack{
                if index == (angles.count-1){
                    MyChart(startAngle: angles[index], endAngle: .degrees(360)).fill(colors[index])
                }
                else{
                    MyChart(startAngle: angles[index], endAngle: angles[index+1]).fill(colors[index])
                }
            }.frame(width :250,height: 250)
        }
    }

    struct MyChart : Shape{
        var startAngle : Angle
        var endAngle : Angle

        func path(in rect :CGRect)-> Path{
            Path{(path) in
                let center = CGPoint(x:rect.midX,y:rect.midY)
                path.move(to:center)
                path.addArc(center:center,radius:rect.midX,startAngle: startAngle,endAngle: endAngle,clockwise: false)
            }
        }
    }
