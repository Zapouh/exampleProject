//
//  City.swift
//  Deal
//
//  Created by Pierre Doury on 03/10/2022.
//

import Foundation

struct Cities: Codable {
    let cities: [City]
    
    struct City: Codable {
        struct ChannelInfo: Codable {
            struct MapInfo: Codable {
                struct Geolocation: Codable {
                    let latitude: Float
                    let longitude: Float
                }
                let geolocation: Geolocation
                let zoom: Int
            }
            let title: String
            let previewMessage: String?
            let mapInfo: MapInfo
            let isDefault: Bool
            let excludeFromSubscription: Bool
            let images: Image
        }
        
        
        struct Image: Codable {
            let small: String
            let large: String
        }
        
        let id: String
        let channelInfo: ChannelInfo
    }
}

