//
//  CityServiceMock.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 02/08/2024.
//

import Foundation

//  A simulation was created to test
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
        
        guard let url = Bundle.main.url(forResource: CityServiceMockConstants.resouce, withExtension: CityServiceMockConstants.json) else {
            throw NSError(domain: CityServiceMockConstants.domainNSError, code: 1, userInfo: [NSLocalizedDescriptionKey: CityServiceMockConstants.userInfoNSLocalized])
        }
        
        let data = try Data(contentsOf: url)
        let cities = try JSONDecoder().decode([CityModel].self, from: data)
        return cities
    }
}


