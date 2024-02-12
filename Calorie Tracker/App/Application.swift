//
//  GoGuessApp.swift
//  GoGuess
//
//  Created by valod on 13.11.23.
//

import SwiftUI
import SwiftData

@main
struct Application: App {
    var body: some Scene {
        WindowGroup {
            InitialView()
        }
        .modelContainer(for: [DietItem.self])
    }
}
