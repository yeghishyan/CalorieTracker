//
//  ChartItem.swift
//  Calorie Tracker
//
//  Created by valod on 23.11.23.
//

import SwiftUI
import SwiftData

struct ChartItem {
    var name: String
    var currentValue: Double
    var todayValue: Double
    
    var bgColor: String
    var progressColor: String
    
    init(name: String, currentValue: Double, todayValue: Double, bgColor: String, progressColor: String) {
        self.name = name
        self.currentValue = currentValue
        self.todayValue = todayValue
        self.bgColor = bgColor
        self.progressColor = progressColor
    }

    var progress: Double { currentValue/todayValue }
}

let demo: [ChartItem] = [
    ChartItem(
        name: "Calories",
        currentValue: 788, todayValue: 2200,
        bgColor: "F3F3E0", progressColor: "F0D101"
    ),
    ChartItem(
        name: "Protein",
        currentValue: 45, todayValue: 65,
        bgColor: "E4EBF7", progressColor: "6186E5"
    ),
    ChartItem(
        name: "Carbs",
        currentValue: 78, todayValue: 325,
        bgColor: "E0F1E1", progressColor: "57E328"
    ),
    ChartItem(
        name: "Fat",
        currentValue: 21, todayValue: 90,
        bgColor: "F3DEE8", progressColor: "F30F57"
    )
]
