//
//  File.swift
//  
//
//  Created by Nikolai Baklanov on 11.12.2023.
//

import Foundation
import SwiftUI

public enum NavigationType {
    case pop
    case push
    case popToRoot
}

public enum TransitionType {
    case none
    case custom(AnyTransition)
}
