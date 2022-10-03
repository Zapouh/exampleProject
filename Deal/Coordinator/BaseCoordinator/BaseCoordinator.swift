//
//  BaseCoordinator.swift
//  Enigma
//
//  Created by Pierre Doury on 12/08/2022.
//  Copyright © 2022 Swatch. All rights reserved.
//

import UIKit

public class BaseCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    
    // MARK: - Vars & Lets
    
    var childCoordinators = [Coordinator]()
    
    // MARK: - Public methods
    
    func addDependency(_ coordinator: Coordinator) {
        if childCoordinators.firstIndex(where: { $0 === coordinator }) != nil  {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        if let idx = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: idx)
        }
    }
    
    // MARK: - Coordinator
    
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        
    }
    
    required init(container: Container, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.childCoordinators = []
    }
    
}
