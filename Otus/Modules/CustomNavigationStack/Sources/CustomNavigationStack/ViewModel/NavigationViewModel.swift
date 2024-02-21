//
//  File.swift
//  
//
//  Created by Nikolai Baklanov on 11.12.2023.
//

import Foundation
import SwiftUI

public class NavigationViewModel: ObservableObject {
    @Published public var currentScreen: Screen?

    var currentNavigationType: NavigationType = .push

    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }

    private let animation: Animation
    
    public init(animation: Animation = .easeInOut) {
        self.animation = animation
    }

    public func push(screenView: any View) {
        withAnimation(animation) {
            self.currentNavigationType = .push
            self.screenStack.push(
                newScreen: Screen(id: UUID().uuidString, view: AnyView(screenView))
            )
        }
    }

    public func pop() {
        withAnimation(animation) {
            self.currentNavigationType = .pop
            self.screenStack.pop()
        }
    }

    public func popToRoot() {
        withAnimation(animation) {
            self.currentNavigationType = .popToRoot
            self.screenStack.popToRoot()
        }
    }
}
