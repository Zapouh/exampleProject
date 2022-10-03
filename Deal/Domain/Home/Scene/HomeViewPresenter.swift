//
//  HomeViewPresenter.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation

protocol HomeViewPresenterOutput: AnyObject {
    func display(_ viewModel: HomeViewModel)
}

final class HomeViewPresenter {
    weak var output: HomeViewPresenterOutput?
    public init() {}
}

extension HomeViewPresenter: HomeViewInteractorOutput {

    func display(_ model: HomeModel) {
        if let value = model.value {
            let viewModel = HomeViewModel(cities: value.cities.map({ CityModel(name: $0.id, image: $0.channelInfo.images.small) }))
            self.output?.display(viewModel)
        } else {
            self.output?.display(HomeViewModel(cities: []))
        }
    }
}
