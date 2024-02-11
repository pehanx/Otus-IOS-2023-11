//
//  NavigationBack.swift
//  Otus
//
//  Created by Nikita Spekhin on 11.02.2024.
//

import SwiftUI
import CustomNavigationStack

struct NavigationBack: View {
    @EnvironmentObject var viewModel: NavigationViewModel
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    viewModel.pop()
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

#Preview {
    NavigationBack()
}
