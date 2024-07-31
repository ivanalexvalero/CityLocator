//
//  CityService.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 30/07/2024.
//

import Foundation
import Observation

@Observable
class CityService {
    func fetchCities(completion: @escaping (Result<[CityModel], Error>) -> Void) {
        let url = URL(string: URLs.citiesEndpoint)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let cities = try JSONDecoder().decode([CityModel].self, from: data)
                    print("Cities: ", cities)
                    completion(.success(cities))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}
