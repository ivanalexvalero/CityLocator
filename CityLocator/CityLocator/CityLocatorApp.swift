//
//  CityLocatorApp.swift
//  CityLocator
//
//  Created by Ivan Alexander Valero on 29/07/2024.
//

import SwiftUI
import SwiftData

@main
struct CityLocatorApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            CityListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
