//
//  CircleChartView.swift
//  Calorie Tracker
//
//  Created by valod on 23.11.23.
//

import SwiftUI

struct CircleChartView: View {
    var items: [ChartItem]
    
    var body: some View {
        ZStack {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                CircleItemView(
                    progress: item.progress,
                    bgColor: Color(hex: item.bgColor),
                    progressColor: Color(hex: item.progressColor),
                    ringRadius: Double(index)*25.0,
                    thickness: 25.0/1.5
                )
            }
        }
    }
}

struct CircleItemView: View {
    var progress: Double
    var bgColor: Color
    var progressColor: Color
    var ringRadius: Double = 60.0
    var thickness: CGFloat = 20.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(bgColor, lineWidth: thickness)
                .frame(width:CGFloat(ringRadius) * 2.0)
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(
                    progressColor,
                    style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width:CGFloat(ringRadius) * 2.0)
        }
    }
}

#Preview {
    CircleChartView(items: demo)
}
