//
//  ChartItem.swift
//  Calorie Tracker
//
//  Created by valod on 23.11.23.
//

import SwiftUI

struct ChartItem {
    var name: String
    var currentValue: Double
    var todayValue: Double
    
    var progress: Double { currentValue/todayValue }
    var bgColor: Color
    var progressColor: Color
}


let demo: [ChartItem] = [
    ChartItem(
        name: "Calories",
        currentValue: 788, todayValue: 2200,
        bgColor: Color(hex: "F3F3E0"), progressColor: Color(hex: "F0D101")
    ),
    ChartItem(
        name: "Protein",
        currentValue: 45, todayValue: 65,
        bgColor: Color(hex: "E4EBF7"), progressColor: Color(hex: "6186E5")
    ),
    ChartItem(
        name: "Carbs",
        currentValue: 78, todayValue: 325,
        bgColor: Color(hex: "E0F1E1"), progressColor: Color(hex: "57E328")
    ),
    ChartItem(
        name: "Fat",
        currentValue: 21, todayValue: 90,
        bgColor: Color(hex: "F3DEE8"), progressColor: Color(hex: "F30F57")
    )
]
