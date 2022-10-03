//
//  HomeViewInteractor.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation


protocol HomeViewInteractorOutput: AnyObject {
    func display(_ model: HomeModel)
}

final class HomeViewInteractor {
    var output: HomeViewInteractorOutput?
    private var networkingWorker: NetworkingWorker?
    init(networkingWorker: NetworkingWorker) {
        self.networkingWorker = networkingWorker
    }
    
    public func getCities() async throws -> Cities {
        
        let url = URL(string: "http://testfoodios.herokuapp.com/settings")!
        let networkWorker = NetworkingWorker()
        do {
            let result: Result<Cities, Error> = try await networkWorker.request(fromURL: url)
            switch result {
            case .success(let result):
                return result
            case .failure(let error):
                throw error
            }
        } catch {
            throw error
        }
    }
}

extension HomeViewInteractor: HomeViewControllerOutput {
    func requestContent() {
        Task {
            do {
                let cities = try await getCities()
                let model = HomeModel(value: cities)
                self.output?.display(model)
            } catch {
                self.output?.display(HomeModel(value: nil))
            }
        }
    }
}
