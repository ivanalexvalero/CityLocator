//
//  CityLocatorView.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 05/08/2024.
//

import SwiftUI

struct CityLocatorView: View {
    @ObservedObject var viewModel: CityViewModel
    private let orientationManager: OrientationManager
    
    init(viewModel: CityViewModel) {
        self.viewModel = viewModel
        self.orientationManager = OrientationManager(viewModel: viewModel)
    }
    
    var body: some View {
        orientationManager.handleOrientation { isLandscape in
            Group {
                if isLandscape {
                    // Landscape
                    HStack {
                        VStack {
                            CityListView(viewModel: viewModel)
                                .frame(width: UIScreen.main.bounds.width * 0.34)
                                .padding(.horizontal, 2)
                        }
                        if let selectedCity = viewModel.selectedCity {
                            CityMapView(city: selectedCity)
                                .frame(width: UIScreen.main.bounds.width * 0.5)
                        } else {
                            CityText(text: CityLocatorConstants.emptyMapText)
                                .frame(width: UIScreen.main.bounds.width * 0.5)
                        }
                    }
                } else {
                    // Portrait
                    CityListView(viewModel: viewModel)
                        .sheet(item: $viewModel.selectedCity) { city in
                            CityMapView(city: city)
                        }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

#Preview {
    CityLocatorView(viewModel: CityViewModel(cityService: CityServiceMock()))
}

