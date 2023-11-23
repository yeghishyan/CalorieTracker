//
//  HomeVM.swift
//  GoGuess
//
//  Created by valod on 22.11.23.
//

import SwiftUI

class HomeVM: ObservableObject {
    enum TabItem: CaseIterable, Identifiable {
        case leaderBoard
        case main
        case settings
        
        var id: Int { self.hashValue }
        
        var image: String {
            switch self {
            case .leaderBoard: return "leaderboardIcon"
            case .main: return "mainIcon"
            case .settings: return "settingsIcon"
            }
        }
    }
    
    @Published var selectedTab: TabItem = .main
}
