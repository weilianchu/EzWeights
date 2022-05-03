//
//  EzWeightsApp.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/3/22.
//

import SwiftUI

@main
struct EzWeightsApp: App {
    @ObservedObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(appState)
        }
    }
}

final class AppState : ObservableObject {
    @Published var rootViewId = UUID()
}
