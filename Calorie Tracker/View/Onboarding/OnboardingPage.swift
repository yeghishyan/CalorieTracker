//
//  OnboardingPage.swift
//  GoGuess
//
//  Created by valod on 22.11.23.
//

import SwiftUI

struct OnboardingPage: View {
    @EnvironmentObject var appVM: ApplicationVM
    @StateObject var onboardingVM = OnboardingVM()
        
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(onboardingVM.state.image)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            Text(onboardingVM.state.title)
                .font(.system(size: 22, weight: .bold))
                .padding(.bottom, 260)
            
            Text(onboardingVM.state.description)
                .font(.system(size: 14, weight: .medium))
                .lineLimit(nil).multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                .padding(.bottom, 190)
            
            onboardingViewContent()
        }
        .animation(.easeIn(duration: 0.3), value: onboardingVM.state)
        .foregroundStyle(.white)
        .ignoresSafeArea()
    }

    @ViewBuilder
    func onboardingViewContent() -> some View {
        ZStack(alignment: .bottom, content: {
            HStack {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: onboardingVM.state == .explore ? 20 : 8, height: 3)
                    .foregroundStyle(onboardingVM.state == .explore ? .white : .white.opacity(0.5))

                RoundedRectangle(cornerRadius: 3)
                    .frame(width: onboardingVM.state == .adventure ? 20 : 8, height: 3)
                    .foregroundStyle(onboardingVM.state == .adventure ? .white : .white.opacity(0.5))
                    
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: onboardingVM.state == .guess ? 20 : 8, height: 3)
                    .foregroundStyle(onboardingVM.state == .guess ? .white : .white.opacity(0.5))
                
            }
            .padding(.bottom, 170)
            
            Button(action: {
                if let nextPath = onboardingVM.state.next() {
                    print("nexPath: ", nextPath.title)
                    //appVM.paths.append(.onboarding(nextPath))
                    onboardingVM.state = nextPath
                } else {
                    appVM.state = .homePage
                }
            }, label: {
                if case .guess = onboardingVM.state {
                    ZStack {
                        Color.white
                        Text("start the game".capitalized)
                            .foregroundStyle(Color(hex: "#8FCA56"))
                    }
                    .frame(width: 223, height: 58)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                } else {
                    ZStack {
                        Image("onboarding_button")
                            .resizable()
                            .frame(width: 46, height: 46)
                        
                        Circle()
                            .stroke(lineWidth: 3)
                            .fill(.white.opacity(0.5))
                            .frame(width: 76, height: 76)
                        
                        Circle()
                            .trim(from: 0, to: onboardingVM.state.trimValue)
                            .stroke(lineWidth: 3).rotation(.degrees(90))
                            .fill(.white)
                            .frame(width: 76, height: 76)
                    }
                }
            })
            .buttonStyle(ScaledButtonStyle())
            .padding(.bottom, 80)
        })
        .foregroundStyle(.white)
    }
}
