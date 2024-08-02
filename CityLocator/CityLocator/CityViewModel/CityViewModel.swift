//
//  CityViewModel.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var cities: [CityModel] = []
    @Published var filter: String = "" {
        didSet {
            filterCities()
        }
    }
    @Published var filteredCities: [CityModel] = []
    private var cityService = CityService()
    
    init() {
        loadCities()
    }
    
    func loadCities() {
        cityService.fetchCities { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cities):
                    self.cities = cities
                    self.filterCities()
                case .failure(let error):
                    // Manejo de errores
                    print(error)
                }
            }
        }
    }
    
    private func filterCities() {
        if filter.isEmpty {
            filteredCities = cities.sorted { $0.name < $1.name }
        } else {
            filteredCities = cities.filter {
                $0.name.lowercased().hasPrefix(filter.lowercased())
            }.sorted { $0.name < $1.name }
        }
    }
}
