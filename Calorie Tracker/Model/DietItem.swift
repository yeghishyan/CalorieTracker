//
//  DietItem.swift
//  Calorie Tracker
//
//  Created by valod on 24.11.23.
//

import SwiftUI

struct DietItem {
    struct Nutrient {
        var name: String
        var value: Double
        var bgColor: Color
        var progressColor: Color
    }
    
    var name: String
    var description: String
    
    var nutrients: [ChartItem]
}

var salmonSalad: DietItem = DietItem(
    name: "Salmon salad",
    description: "Atkins 20, Atkins 40, Atkins 100, Atkins Friendly, Low Carb, Carb Friendly, Ketogenic Diet",
    nutrients: salmonNutrients
)

let salmonNutrients: [ChartItem] = [
    ChartItem(
        name: "Calories",
        currentValue: 389, todayValue: 500,
        bgColor: Color(hex: "F3DEE8"), progressColor: Color(hex: "F30F57")
    ),
    ChartItem(
        name: "Protein",
        currentValue: 41, todayValue: 500,
        bgColor: Color(hex: "E0F1E1"), progressColor: Color(hex: "57E328")
    ),
    ChartItem(
        name: "Carbs",
        currentValue: 7.8, todayValue: 500,
        bgColor: Color(hex: "E4EBF7"), progressColor: Color(hex: "6186E5")
    ),
    ChartItem(
        name: "Fat",
        currentValue: 21, todayValue: 500,
        bgColor: Color(hex: "F3F3E0"), progressColor: Color(hex: "F0D101")
    )
]
