//
//  CityServiceMock.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 02/08/2024.
//

import Foundation

//  Se creo este serviceMock para utilizar la respuesta de un json local para poder probar los componentes de una manera mas rapida con pocos elementos y, ademas, poder hacer pruebas de unit test.
class CityServiceMock: CityServiceProtocol {
    enum MockError: Error {
        case fileNotFound
        case decodingError
    }
    
    var shouldReturnError: Bool = false
    
    func fetchCities() async throws -> [CityModel] {
        if shouldReturnError {
            throw MockError.fileNotFound
        }
        
        guard let url = Bundle.main.url(forResource: "citiesDB", withExtension: "json") else {
            throw NSError(domain: "MockCityServiceError", code: 1, userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }
        
        let data = try Data(contentsOf: url)
        let cities = try JSONDecoder().decode([CityModel].self, from: data)
        return cities
    }
}


