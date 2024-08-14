//
//  CityGenericError.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 09/08/2024.
//

import Foundation

enum CityGenericError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case unknownError
    case errorDefaultMessage
}

extension CityGenericError {
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .networkError:
            return "A network error occurred"
        case .decodingError:
            return "A decoding error occurred"
        case .unknownError:
            return "An unknown error occurred"
        case .errorDefaultMessage:
            return "An error occurred"
        }
    }
}
