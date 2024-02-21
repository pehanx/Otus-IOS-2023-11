//
//  DetailArtworksView.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import CustomNavigationStack
import OtusUI

struct DetailArtworksView: View {
    @EnvironmentObject var viewModel: NavigationViewModel
    var artwork: Artwork
    
    init(_ artwork: Artwork) {
        self.artwork = artwork
    }
    
    var body: some View {
        VStack {
            NavigationBack {
                viewModel.pop()
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(artwork.title)
                    .font(.headline)
                Text("Artist - " + artwork.artistDisplay)
                    .font(.subheadline)
                if let placeOfOrigin = artwork.placeOfOrigin {
                    Text("Place - " + placeOfOrigin)
                        .font(.callout)
                }
            }.padding(.horizontal, 16)
            Spacer()
        }
    }
}
