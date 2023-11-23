//
//  OnboardingVM.swift
//  GoGuess
//
//  Created by valod on 13.11.23.
//

import SwiftUI

class OnboardingVM: ObservableObject {
    enum OnboardingState: Hashable {
        case explore
        case adventure
        case guess
        
        var image: String {
            switch self {
            case .explore: return "onboarding_1"
            case .adventure: return "onboarding_2"
            case .guess: return "onboarding_3"
            }
        }
        
        var title: String {
            switch self {
            case .explore: return "Let’s Explore The World!"
            case .adventure: return "Join the Adventure!"
            case .guess: return "Guess where you are?"
            }
        }
        
        var description: String {
            switch self {
            case .explore: return "Embark on a global journey from Paris to Machu Picchu, with immersive 360° views and test your geographic knowledge."
            case .adventure: return "Become a Sherlock in thrilling competitions. Observe, explore, and search for clues to outsmart your opponents!"
            case .guess: return "Observe closely and search for any signs that will help you understand where you are."
            }
        }
        
        var trimValue: CGFloat {
            switch self {
            case .explore: return 0
            case .adventure: return 0.5
            case .guess: return 1
            }
        }
        
        func next() -> OnboardingState? {
            switch self {
            case .explore: return OnboardingState.adventure
            case .adventure: return OnboardingState.guess
            default: return nil
            }
        }
    }

    @Published var state: OnboardingState = .explore
}
