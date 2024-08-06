//
//  CityServiceMock.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 02/08/2024.
//

import Foundation

//  Se creo este serviceMock para utilizar la respuesta de un json local para poder probar los componentes de una manera mas rapida con pocos elementos y, ademas, poder hacer pruebas de unit test.
class CityServiceMock: CityServiceProtocol {
    func fetchCities(completion: @escaping (Result<[CityModel], Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "citiesDB", withExtension: "json") else {
            completion(.failure(NSError(domain: "MockCityServiceError", code: 1, userInfo: [NSLocalizedDescriptionKey: "File not found"])))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let cities = try JSONDecoder().decode([CityModel].self, from: data)
            completion(.success(cities))
        } catch {
            completion(.failure(error))
        }
    }
}
