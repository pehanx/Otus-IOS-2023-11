//
//  CustomContentView.swift
//  NavTest
//
//  Created by Nikolai Baklanov on 12.12.2023.
//

import SwiftUI
import CustomNavigationStack

let viewModel = NavigationViewModel()

struct CustomContentView: View {
    var body: some View {
        VStack {
            HStack {
                if viewModel.currentScreen == nil {
                    EmptyView()
                } else {
                    
                }
            }
            CustomNavigationView(viewModel: viewModel,
                                 transition: (push: .iris, pop: .slide)) {
                CustomRootView()
            }
        }

    }
}
