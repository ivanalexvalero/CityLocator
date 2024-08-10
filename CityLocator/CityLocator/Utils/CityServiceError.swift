//
//  CityServiceError.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 09/08/2024.
//

import Foundation

enum CityServiceError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case unknownError
}
