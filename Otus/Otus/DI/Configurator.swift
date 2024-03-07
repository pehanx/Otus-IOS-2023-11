//
//  Configurator.swift
//  Otus
//
//  Created by Nikita Spekhin on 07.03.2024.
//

import Foundation
import OtusNetworkingCore

class Configurator {
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addServices(service: NetworkService())
    }
}
