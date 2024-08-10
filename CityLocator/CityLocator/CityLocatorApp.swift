//
//  CityLocatorApp.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 29/07/2024.
//

import SwiftUI

@main
struct CityLocatorApp: App {
    @StateObject private var cityViewModel: CityViewModel

    init() {
        // modo debug para hacer uso del mock
        // modo release para consumir el servicio
        #if DEBUG
        let cityService: CityServiceProtocol = CityServiceMock()
        #else
        let cityService: CityServiceProtocol = CityService()
        #endif
        
        _cityViewModel = StateObject(wrappedValue: CityViewModel(cityService: cityService))
    }
    
    var body: some Scene {
        WindowGroup {
            CityLocatorView(viewModel: cityViewModel)
        }
    }
}
