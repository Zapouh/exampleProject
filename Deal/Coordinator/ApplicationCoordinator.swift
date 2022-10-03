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
        let homeView = self.getHomeViewController()
        tabBar.viewControllers = [homeView, UIViewController(), UIViewController()]
        
        self.router.push(tabBar)
    }
    
    private func getHomeViewController() -> HomeViewController {
        let interactor = HomeViewInteractor(networkingWorker: NetworkingWorker())
        let presenter = HomeViewPresenter()
        let controller = HomeViewController()
        
        presenter.output = controller
        interactor.output = presenter
        controller.output = interactor
        controller.tabBarItem = UITabBarItem(title: "Hello", image: UIImage(systemName: "circle"), selectedImage: UIImage(systemName: "circle"))
        return controller
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
