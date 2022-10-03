//
//  ApplicationCoordinator.swift
//  Enigma
//
//  Created by Pierre Doury on 12/08/2022.
//  Copyright © 2022 Swatch. All rights reserved.
//

import Foundation
import UIKit

public class Container {
    
}
public class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Vars & Lets
    
    private let container: Container
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private var launchInstructor = LaunchInstructor.configure()
    private let viewControllerFactory: ViewControllerFactory = ViewControllerFactory()
    
    // MARK: - Coordinator
    
    override public func start(with option: DeepLinkOption?) {
        if option != nil {
            
        } else {
            runOnboardingUserNameScreen()
        }
    }
    
    // MARK: - Private methods
    
    private func runOnboardingUserNameScreen() {
        
        
        let tabBar = UITabBarController()
        let homeView = HomeViewController()
        homeView.tabBarItem = UITabBarItem(title: "Hello", image: UIImage(systemName: "circle"), selectedImage: UIImage(systemName: "circle"))
        
        tabBar.viewControllers = [homeView, UIViewController(), UIViewController()]
        
        self.router.push(tabBar)
//        let coordinator: OnboardingUserCoordinator = self.coordinatorFactory.makeScreen(container: self.container, router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: self.viewControllerFactory)
//        
//        coordinator.finishFlow = { [unowned self, unowned coordinator] state in
//            self.removeDependency(coordinator)
//            switch state {
//            case .dashboard:
//                self.runDashboardScreen()
//            case .pairing:
//                self.runOnBoardingScreen()
//            }
//        }
//        self.addDependency(coordinator)
//        coordinator.start()
    }
    
    
    // MARK: - Init
    
    public init(container: Container, router: Router, coordinatorFactory: CoordinatorFactory) {
        self.container = container
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        super.init(container: container, router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
    }
    
    required init(container: Container, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        fatalError("init(container:router:coordinatorFactory:viewControllerFactory:) has not been implemented")
    }
    
}
