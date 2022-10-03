//
//  ViewControllerFactory.swift
//  Enigma
//
//  Created by Pierre Doury on 12/08/2022.
//  Copyright © 2022 Swatch. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    enum ViewControllerInstance {
        case splashScreen
        case authentication
        case bluetoothPermission
        case onBoarding
        case onBoardingWatchTooFar
        case onBoardingNoBluetooth
        case dashboard
        case watchManagement
        case firmwareUpdate
        case onBoardingNameUser
        case onBoardingCreationUser
        
        var storyboardName: String? {
            switch self {
            case .splashScreen:
                return "EnigmaSplashScreen"
            case .authentication:
                return "Main"
            case .bluetoothPermission:
                return "Permissions"
            case .onBoarding:
                return "Onboarding"
            case .onBoardingWatchTooFar, .onBoardingNoBluetooth:
                return "Pairing"
            case .dashboard, .watchManagement:
                return "Dashboard"
            case .firmwareUpdate, .onBoardingNameUser, .onBoardingCreationUser:
                return nil
            }
        }
        
        var identifier: String {
            switch self {
            case .splashScreen:
                return "SplashScreenViewController"
            case .authentication:
                return "AuthenticationSceneID"
            case .bluetoothPermission:
                return "BluetoothPermissionViewControllerID"
            case .onBoarding:
                return "OnBoardingWrapperID"
            case .onBoardingWatchTooFar:
                    return "OnBoardingWatchTooFarID"
            case .onBoardingNoBluetooth:
                return "OnBoardingNoBluetoothID"
            case .dashboard:
                return "DashboardSceneID"
            case .watchManagement:
                return "WatchManagementSceneID"
            case .firmwareUpdate:
                return "FirmwareUpdateViewController"
            case .onBoardingNameUser:
                return "OnBoardingNameViewController"
            case .onBoardingCreationUser:
                return "OnBoardingUserCreationViewController"
            }
        }
    }
    
    func instantiateViewController<T: UIViewController>(instance: ViewControllerInstance) -> T {
        let bundle = Bundle(for: T.self)
        if let storyboardName = instance.storyboardName {
            let storyboard = UIStoryboard.init(name: storyboardName, bundle: bundle)
            // swiftlint:disable:next force_cast
            let viewController = storyboard.instantiateViewController(withIdentifier: instance.identifier) as! T // swiftlint:disable:this force_cast
            return viewController
        } else {
            let viewController = T.init(nibName: instance.identifier, bundle: bundle)
            return viewController
        }
    }
}
