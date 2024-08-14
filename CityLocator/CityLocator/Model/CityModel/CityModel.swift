//
//  CityModel.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 30/07/2024.
//

import Foundation

struct CityModel: Codable, Identifiable, Equatable {
    let country: String
    let name: String
    let id: Int
    let coord: Coordinates
    
    struct Coordinates: Codable, Equatable {
        let lon: Double
        let lat: Double
    }
    
    private enum CodingKeys: String, CodingKey {
        case country, name
        case id = "_id"
        case coord
    }
    
    // Implementación del protocolo Equatable
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        return lhs.country == rhs.country &&
               lhs.name == rhs.name &&
               lhs.id == rhs.id &&
               lhs.coord == rhs.coord
    }
}

