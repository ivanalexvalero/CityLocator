//
//  CityMapView.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 31/07/2024.
//

import SwiftUI
import MapKit

struct CityMapView: View {
    var city: CityModel

    @State private var region: MKCoordinateRegion
    @State private var showInfoSheet = false

    init(city: CityModel) {
        self.city = city
        self._region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .navigationTitle("\(city.name), \(city.country)")
                .navigationBarTitleDisplayMode(.inline)
            VStack {
                Spacer()
                Button {
                    showInfoSheet.toggle()
                } label: {
                    Text("\(CityMapConstants.moreInfo) \(city.name)")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .sheet(isPresented: $showInfoSheet, content: {
                    CityDetailView(city: city)
                        .presentationDetents([.fraction(0.5)])
                })
            }
            .navigationTitle(CityMapConstants.moreInfo)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    CityMapView(city: CityModel.cities)
}
