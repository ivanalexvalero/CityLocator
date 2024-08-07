//
//  CityListView.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import SwiftUI

struct CityListView: View {
    @ObservedObject var viewModel: CityViewModel
    
    init(viewModel: CityViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredCities) { city in
                Button(action: {
                    viewModel.selectedCity = city
                }) {
                    VStack(alignment: .leading) {
                        Text("\(city.name), \(city.country)")
                            .font(.headline)
                        Text("\(CityGeneralConstants.longitude) \(city.coord.lon), \(CityGeneralConstants.latitude) \(city.coord.lat)")
                            .font(.subheadline)
                    }
                }
            }
            .listStyle(.plain)
            .tint(.black)
            .searchable(text: $viewModel.filter, prompt: CityListConstants.promptSearch)
            .onAppear {
                viewModel.loadCities()
            }
            .scrollIndicators(.hidden)
            .navigationTitle(CityListConstants.cities)
            .toolbarBackground(.white, for: .navigationBar)
        }
    }
}

#Preview {
    CityListView(viewModel: CityViewModel(cityService: CityServiceMock()))
}


