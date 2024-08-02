//
//  CityListView.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import SwiftUI

struct CityListView: View {
    @StateObject private var viewModel = CityViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.filteredCities) { city in
                    NavigationLink(destination: CityMapView(city: city)) {
                        VStack(alignment: .leading) {
                            Text("\(city.name), \(city.country)")
                                .font(.headline)
                            Text("\(CityGeneralConstants.longitude) \(city.coord.lon), \(CityGeneralConstants.latitude) \(city.coord.lat)")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle(CityListConstants.cities)
            .searchable(text: $viewModel.filter, prompt: CityListConstants.promptSearch)
            .onAppear {
                viewModel.loadCities()
            }
        }
    }
}

#Preview {
    CityListView()
}
