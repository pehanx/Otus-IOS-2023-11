//
//  NavigationBack.swift
//
//
//  Created by Nikita Spekhin on 21.02.2024.
//

import SwiftUI

public struct NavigationBack: View {
    public var action: (() -> Void)
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    public var body: some View {
        VStack {
            HStack {
                Button(action: {
                    action()
                }, label: {
                    Text("Back")
                })
                Spacer()
            }.padding()
            Spacer()
                .frame(height: 24)
        }
    }
}
