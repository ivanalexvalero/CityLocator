//
//  CityService.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 30/07/2024.
//

import Foundation
import Observation

protocol CityServiceProtocol {
    func fetchCities() async throws -> [CityModel]
}

@Observable
class CityService: CityServiceProtocol {
    private var cache: [CityModel]?

    func fetchCities() async throws -> [CityModel] {
        if let cachedCities = cache {
            return cachedCities
        }

        guard let url = URL(string: URLs.citiesEndpoint) else {
            throw CityServiceError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let cities = try JSONDecoder().decode([CityModel].self, from: data)
            cache = cities
            return cities
        } catch let error as URLError {
            throw CityServiceError.networkError(error)
        } catch let error as DecodingError {
            throw CityServiceError.decodingError(error)
        } catch {
            throw CityServiceError.unknownError
        }
    }
}
