//
//  DietItem.swift
//  Calorie Tracker
//
//  Created by valod on 24.11.23.
//

import SwiftUI
import SwiftData

@Model
class DietItem {
    struct Nutrient {
        var name: String
        var value: Double
        var bgColor: Color
        var progressColor: Color
    }
    
    var name: String
    var desc: String
    
    var nutrients: [ChartItem]
    
    init(name: String, desc: String, nutrients: [ChartItem]) {
        self.name = name
        self.desc = desc
        self.nutrients = nutrients
    }
}

var salmonSalad: DietItem = DietItem(
    name: "Salmon salad",
    desc: "Atkins 20, Atkins 40, Atkins 100, Atkins Friendly, Low Carb, Carb Friendly, Ketogenic Diet",
    nutrients: salmonNutrients
)

let salmonNutrients: [ChartItem] = [
    ChartItem(
        name: "Calories",
        currentValue: 389, todayValue: 500,
        bgColor: "F3DEE8", progressColor: "F30F57"
    ),
    ChartItem(
        name: "Protein",
        currentValue: 41, todayValue: 500,
        bgColor: "E0F1E1", progressColor: "57E328"
    ),
    ChartItem(
        name: "Carbs",
        currentValue: 7.8, todayValue: 500,
        bgColor: "E4EBF7", progressColor: "6186E5"
    ),
    ChartItem(
        name: "Fat",
        currentValue: 21, todayValue: 500,
        bgColor: "F3F3E0", progressColor: "F0D101"
    )
]
