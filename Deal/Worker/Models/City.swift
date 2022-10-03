//
//  City.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation

struct Cities: Codable {
    let cities: [City]
}

struct City: Codable {
    let id: String
    let channelInfo: ChannelInfo
}

struct ChannelInfo: Codable {
    let title: String
    let previewMessage: String?
    let mapInfo: MapInfo
    let isDefault: Bool
    let excludeFromSubscription: Bool
    let images: Image
}

struct MapInfo: Codable {
    let geolocation: Geolocation
    let zoom: Int
}

struct Geolocation: Codable {
    let latitude: Float
    let longitude: Float
}

struct Image: Codable {
    let small: String
    let large: String
}
