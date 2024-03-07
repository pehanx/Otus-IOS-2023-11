//
//  OtusApp.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI

@main
struct OtusApp: App {
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
