//
//  File.swift
//  
//
//  Created by Nikolai Baklanov on 11.12.2023.
//

import Foundation
import SwiftUI

public struct Screen: Equatable {
    let id: String
    let view: AnyView

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
