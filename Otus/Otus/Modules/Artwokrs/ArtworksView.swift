//
//  ArtworksView.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import CustomNavigationStack

struct ArtworksView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @ObservedObject var viewModel: ArtworksViewModel
    var body: some View {
        List(viewModel.artworks) { artwork in
            VStack(alignment: .leading) {
                Text(artwork.title)
            }
            .onTapGesture {
                navigationViewModel.push(screenView: DetailArtworksView(artwork))
            }
            .onAppear {
                if viewModel.isCanLoadMore(for: artwork) {
                    viewModel.loadMore()
                }
            }
        }
    }
}
