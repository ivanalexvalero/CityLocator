//
//  CityViewModel.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var cities: [CityModel] = []
    @Published var filteredCities: [CityModel] = []
    @Published var selectedCity: CityModel?
    @Published var isLandscape: Bool = false
    @Published var filter: String = "" {
        didSet {
            filterCities()
        }
    }
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cityService: CityServiceProtocol
    private var allCities: [CityModel] = []

    init(cityService: CityServiceProtocol) {
        self.cityService = cityService
        Task {
            await loadCities()
        }
    }

    func loadCities() async {
        self.isLoading = true
        do {
            let allCities = try await cityService.fetchCities()
            // Actualiza la UI en el hilo principal
            await MainActor.run {
                self.allCities = allCities
                self.cities = allCities
                self.filterCities()
                self.isLoading = false
            }
        } catch let error as CityServiceError {
            await MainActor.run {
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        } catch {
            await MainActor.run {
                self.isLoading = false
                self.errorMessage = "A ocurrido un error"
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
