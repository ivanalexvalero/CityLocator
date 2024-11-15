//
//  CityDetailView.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import SwiftUI

struct CityDetailView: View {
    let city: CityModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                CityText(text: "\(city.name), \(city.country)")
                    .font(.title)
                CityText(text: "\(CityGeneralConstants.longitude.replacingOccurrences(of: Constants.placeholder, with: "\(city.coord.lon)")), \(CityGeneralConstants.latitude.replacingOccurrences(of: Constants.placeholder, with: " \(city.coord.lat)"))")
                    .font(.subheadline)
            }
            .padding()
            .navigationTitle(CityDetailConstants.citiesDetails)
            .navigationBarTitleDisplayMode(.inline)
            .font(.title3)
            .frame(height: 300)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: CityDetailConstants.closeView)
                            .foregroundColor(.red)
                            .font(.title3)
                    }
                }
            }
        }
    }
}

#Preview {
    CityDetailView(city: CityModel.cities)
}
