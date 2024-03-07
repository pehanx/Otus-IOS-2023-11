//
//  BeersView.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import CustomNavigationStack

struct BeersView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @ObservedObject var viewModel:BeersViewModel
    
    var body: some View {
        List(viewModel.items) { beer in
            VStack(alignment: .leading) {
                Text(beer.name)
            }
            .onTapGesture {
                navigationViewModel.push(screenView: DetailBeersView(beer))
            }
            .onAppear {
                if viewModel.isCanLoadMore(for: beer) {
                    viewModel.loadMore()
                }
            }
        }
    }
}
