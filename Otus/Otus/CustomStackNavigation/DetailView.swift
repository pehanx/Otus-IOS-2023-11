//
//  DetailView.swift
//  NavTest
//
//  Created by Nikolai Baklanov on 12.12.2023.
//

import SwiftUI
import CustomNavigationStack

struct DetailView: View {
    @EnvironmentObject var viewModel: NavigationViewModel
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text("Detail")
                Button(action: {
                    viewModel.push(screenView: DetailView())
                }, label: {
                    Text("Push")
                })
                Button(action: {
                    viewModel.pop()
                }, label: {
                    Text("Pop")
                })
                Spacer()
            }
            Spacer()
        }
        .background(Color.green)

    }
}