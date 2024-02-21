//
//  SwiftUIView.swift
//  
//
//  Created by Nikolai Baklanov on 11.12.2023.
//

import SwiftUI

public struct CustomNavigationView<Content: View>: View {
    @ObservedObject var viewModel: NavigationViewModel
    
    private let content: Content    
    private let transition: (push: AnyTransition, pop: AnyTransition)

    public init(
        viewModel: NavigationViewModel,
        transition: (push: AnyTransition, pop: AnyTransition),
        contentBuilder: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.content = contentBuilder()
        self.transition = transition
    }

    public var body: some View {
        let isRoot = viewModel.currentScreen == nil
        ZStack {
            if isRoot {
                self.content
                    .environmentObject(viewModel)
                    .transition(viewModel.currentNavigationType == .push ? transition.push : transition.pop)
            } else {
                self.viewModel.currentScreen?.view
                    .environmentObject(viewModel)
                    .transition(viewModel.currentNavigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
