//
//  OrientationManager.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 06/08/2024.
//

import SwiftUI

struct OrientationManager {
    @ObservedObject var viewModel: CityViewModel
    
    func handleOrientation<Content: View>(@ViewBuilder content: @escaping (Bool) -> Content) -> some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            content(isLandscape)
                .onAppear {
                    viewModel.updateOrientation(isLandscape: isLandscape)
                }
        }
    }
}
