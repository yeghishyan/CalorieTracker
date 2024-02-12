//
//  HorizontalCircleChartView.swift
//  Calorie Tracker
//
//  Created by valod on 24.11.23.
//

import SwiftUI

struct HorizontalCircleChartView: View {
    var items: [ChartItem]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                CircleItemView(
                    progress: item.progress,
                    bgColor: Color(hex: item.bgColor),
                    progressColor: Color(hex: item.progressColor),
                    ringRadius: 30.0,
                    thickness: 30.0/3
                )
                .overlay(content: {
                    Text(String(format: "%.2f", item.currentValue))
                        .font(.system(size: 13, weight: .medium))
                })
            }
        }
    }
}
