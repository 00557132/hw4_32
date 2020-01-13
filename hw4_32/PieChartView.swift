//
//  PieChartView.swift
//  hw4_32
//
//  Created by User03 on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct PieChartView: View {
    var percentages: [Double]
    var angles: [Angle]
    
    init(percentages: [Double]) {
        self.percentages = percentages
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in percentages {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage / 100
        }
    }
    
    var body: some View {
        VStack{
            ZStack {
            PieChart(startAngle: self.angles[0], endAngle: self.angles[1])
                .fill(Color.red)
            PieChart(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color.orange)
            PieChart(startAngle: self.angles[2], endAngle: self.angles[0])
                .fill(Color.green)
            Text("鼠鼠的一天")
                .font(.title)
                .foregroundColor(Color.black)
                .background(Color.white)
            }.frame(width: 350, height: 350)
            Text("睡覺")
            .foregroundColor(Color.red)
            Text("跑滾輪")
            .foregroundColor(Color.orange)
            Text("出籠子探險")
            .foregroundColor(Color.yellow)
            Text("吃飯")
            .foregroundColor(Color.green)
            Text("吃獎勵小點心")
            .foregroundColor(Color.blue)
            Text("便便尿尿")
            .foregroundColor(Color.purple)
        }
    }
}


struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [20, 20, 90])
    }
}

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                        startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
