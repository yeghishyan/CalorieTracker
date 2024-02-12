//
//  DietItem.swift
//  Calorie Tracker
//
//  Created by valod on 24.11.23.
//

import SwiftUI
import SwiftData

@Model
final class DietItem {
    var name: String
    var desc: String
    
    @Transient
    var nutrients: [ChartItem] = demo
    
    init(name: String, desc: String, nutrients: [ChartItem]) {
        self.name = name
        self.desc = desc
        self.nutrients = nutrients
    }
}
