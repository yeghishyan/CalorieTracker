//
//  HomeScreen.swift
//  GoGuess
//
//  Created by valod on 22.11.23.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var appVM: ApplicationVM
    @StateObject var homeVM = HomeVM()
    
    @State private var tabSelection: Int = 0
    let tabItems: [HomeVM.TabItem] = [.leaderBoard, .main , .settings]
    
    var body: some View {
        HomeTabView(tabs: tabItems, selection: $tabSelection) { index in
                switch tabItems[index] {
                case .leaderBoard:
                    EmptyView()
                case .main:
                    EmptyView()
                case .settings:
                    SettingsPage()
                }
            }
            //.ignoresSafeArea()
            .onChange(of: tabSelection, onTabSelection)
    }
    
    func onTabSelection(_: Int, index: Int) {
        homeVM.selectedTab = tabItems[index]
    }
}
