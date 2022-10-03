//
//  HomeViewInteractor.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation


protocol HomeViewInteractorOutput: AnyObject {
    
}

final class HomeViewInteractor {
    var output: HomeViewInteractorOutput?
    private var networkingWorker: NetworkingWorker?
    init(networkingWorker: NetworkingWorker) {
        self.networkingWorker = networkingWorker
    }
    
    public func getCities() {
    }
}
