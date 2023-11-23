//
//  ContentView.swift
//  GoGuess
//
//  Created by valod on 13.11.23.
//

import SwiftUI

struct InitialView: View {
    @StateObject var appVM = ApplicationVM()
    
    var body: some View {
        ZStack(alignment: .top) {
            switch appVM.state {
            case .splashScreen:
                SplashScreen()
                
            case .onboarding:
                OnboardingPage()
                
            case .homePage:
                HomePage()
                
            case .todayPage:
                TodayPage()
            }
        }
        .transition(.identity)
        .animation(.default, value: appVM.state)
        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//                appVM.state = .onboarding
//            })
        }
        .environmentObject(appVM)
    }
    
    @ViewBuilder
    func SplashScreen() -> some View {
        ZStack(alignment: .top) {
            Image("SplashScreen")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            Text("GoGuess")
                .padding(.top, 180)
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.white)
        }
        .ignoresSafeArea()
    }
}
