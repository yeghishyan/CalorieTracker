//
//  VerticalChartView.swift
//  Calorie Tracker
//
//  Created by valod on 23.11.23.
//

import SwiftUI

struct VerticalChartView: View {
    var items: [ChartItem]
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                VerticalChartItemView(item: item)
                .padding(.horizontal)
            }
        }
    }
}

struct VerticalChartItemView: View {
    var item: ChartItem
    
    var cornerRadius: CGFloat = 25.0
    var thickness: CGFloat = 11.0
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Circle()
                    .fill(item.progressColor)
                    .frame(width: 8)
                Text(item.name)
                Spacer()
                Text("\(Int(item.currentValue)) / \(Int(item.todayValue))")
            }
            .font(.system(size: 13, weight: .bold))
            
            GeometryReader { proxy in
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(item.bgColor)
                    .frame(maxWidth: proxy.size.width, maxHeight: thickness)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(item.progressColor)
                    .frame(maxWidth: proxy.size.width*item.progress, maxHeight: thickness)
            }
            .frame(maxHeight: thickness)
        }
    }
}

#Preview {
    VerticalChartView(items: demo)
}
