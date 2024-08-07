//
//  CityLocatorApp.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 29/07/2024.
//

import SwiftUI

@main
struct CityLocatorApp: App {
    // Crea la instancia del servicio
    private let cityService: CityServiceProtocol = CityService() // usar CityServiceMock para pruebas
    
    // Crea la instancia del ViewModel
    private var cityViewModel: CityViewModel {
        CityViewModel(cityService: cityService)
    }
    
    var body: some Scene {
        WindowGroup {
            CityLocatorView(viewModel: cityViewModel)
        }
    }
}
