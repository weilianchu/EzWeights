//
//  EzWeightsApp.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/3/22.
//

import SwiftUI

@main
struct EzWeightsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
