//
//  File.swift
//  
//
//  Created by Nikolai Baklanov on 11.12.2023.
//

import Foundation

struct NavigationStack {
    private var screens: [Screen] = []

    func top() -> Screen? {
        screens.last
    }

    mutating func push(newScreen: Screen) {
        screens.append(newScreen)
    }

    mutating func pop() {
        let _ = screens.removeLast()
    }

    mutating func popToRoot() {
        screens.removeAll()
    }
}
