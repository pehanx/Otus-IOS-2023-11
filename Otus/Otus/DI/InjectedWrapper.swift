//
//  InjectedWrapper.swift
//  Otus
//
//  Created by Nikita Spekhin on 07.03.2024.
//

import Foundation
import SwiftUI

@propertyWrapper
struct Injected<T: AnyObject> {
    private var service: T?
    private weak var serviceManager = ServiceLocator.shared
    
    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service =  serviceManager?.resolve(type: T.self)
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }
    
    public var projectedValue:Injected<T> {
        get {return self}
        mutating set {self = newValue}
    }
}
