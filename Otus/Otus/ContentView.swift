//
//  ContentView.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import CustomNavigationStack

struct ContentView: View {
    let viewModel = NavigationViewModel()
    var body: some View {
        CustomNavigationView(viewModel: viewModel,
                             transition: (push: .scale, pop: .opacity)) {
            ListsView()
        }
    }
}
