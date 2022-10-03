//
//  CoordinatorFactoryProtocol.swift
//  Enigma
//
//  Created by Pierre Doury on 12/08/2022.
//  Copyright © 2022 Swatch. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func makeScreen<T: Coordinator>(container: Container, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> T
}

final public class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    // MARK: - CoordinatorFactoryProtocol
    
    func makeScreen<T: Coordinator>(container: Container, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> T {
        let coordinator = T.init(container: container, router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
        return coordinator
    }
    
    public init() {}
}
