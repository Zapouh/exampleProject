//
//  Coordinator.swift
//  Enigma
//
//  Created by Pierre Doury on 12/08/2022.
//  Copyright © 2022 Swatch. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject{
    func start()
    func start(with option: DeepLinkOption?)
    init(container: Container, router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory)
}
