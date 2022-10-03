//
//  LaunchInstructor.swift
//  Enigma
//
//  Created by Pierre Doury on 12/08/2022.
//  Copyright © 2022 Swatch. All rights reserved.
//

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure( isOnboardingPassed: Bool = onboardingWasShown, isAutorized: Bool = isAutorized) -> LaunchInstructor {
        
        switch (isOnboardingPassed, isAutorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}
