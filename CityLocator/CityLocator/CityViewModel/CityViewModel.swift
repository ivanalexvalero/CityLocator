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
    @Published var selectedCity: CityModel?
    @Published var isLandscape: Bool = false
    
    private var cityService: CityServiceProtocol
    
    init(cityService: CityServiceProtocol) {
        self.cityService = cityService
        loadCities()
    }
    
    func loadCities() {
        cityService.fetchCities { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let cities):
                    self.cities = cities
                    self.filterCities()
                case .failure(let error):
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
    
    func updateOrientation(isLandscape: Bool) {
        self.isLandscape = isLandscape
    }
}
