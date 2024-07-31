//
//  CityModel.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 30/07/2024.
//

import Foundation

struct CityModel: Codable, Identifiable {
    let country: String
    let name: String
    let id: Int
    let coord: Coordinates
    
    struct Coordinates: Codable {
        let lon: Double
        let lat: Double
    }
    
    private enum CodingKeys: String, CodingKey {
        case country, name
        case id = "_id"
        case coord
    }
}
