//
//  GoGuessApp.swift
//  GoGuess
//
//  Created by valod on 13.11.23.
//

import SwiftUI

@main
struct GoGuessApp: App {
    var body: some Scene {
        WindowGroup {
            InitialView()
        }
        .modelContainer(for: ChartItem.self)
    }
}
