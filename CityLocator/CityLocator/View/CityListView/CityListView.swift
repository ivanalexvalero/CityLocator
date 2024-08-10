//
//  CityListView.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import SwiftUI

struct CityListView: View {
    @ObservedObject var viewModel: CityViewModel
    @State private var showAlert = false
    
    init(viewModel: CityViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView(CityListConstants.loadingProgress)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        // Se hizo uso de LazyVStack en lugar de List: es más eficiente en términos de uso de memoria y tiempos de renderización
                        ForEach(viewModel.filteredCities) { city in
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
                            .accessibilityIdentifier("city-row-\(city.name)")
                        }
                    }
                    .padding(.leading, 20)
                    .tint(.black)
                }
            }
            .searchable(text: $viewModel.filter, prompt: CityListConstants.promptSearch)
            .onAppear {
                Task {
                    await viewModel.loadCities()
                }
            }
            .navigationTitle(CityListConstants.cities)
            .toolbarBackground(.white, for: .navigationBar)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(CityLocatorError.errorTitle),
                    message: Text(viewModel.errorMessage ?? CityLocatorError.errorAlertMessage),
                    primaryButton: .default(Text(CityLocatorError.errorAlertButton)) {
                        Task {
                            await viewModel.loadCities()
                            self.showAlert = false
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
            .onChange(of: viewModel.errorMessage) { _ in
                self.showAlert = viewModel.errorMessage != nil
            }
        }
    }
}

#Preview {
    CityListView(viewModel: CityViewModel(cityService: CityServiceMock()))
}
