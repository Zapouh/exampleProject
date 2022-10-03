//
//  HomeViewModel.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation

struct HomeViewModel {
    
    let cities: [CityModel]
}

struct CityModel {
    let name: String
    let image: String
}
