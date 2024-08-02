//
//  CityDetailView.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import SwiftUI

struct CityDetailView: View {
    let city: CityModel

    var body: some View {
        VStack (alignment: .leading) {
            Text("\(city.name), \(city.country)")
                .font(.largeTitle)
            Text("\(CityGeneralConstants.longitude) \(city.coord.lon), \(CityGeneralConstants.latitude) \(city.coord.lat)")
                .font(.subheadline)
        }
        .padding()
        .navigationTitle(CityDetailConstants.citiesDetails)
        .frame(height: 300)
    }
}

#Preview {
    CityDetailView(city: CityModel.cities)
}
