//
//  DetailArtworksView.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import SwiftUI
import CustomNavigationStack

struct DetailArtworksView: View {
    @EnvironmentObject var viewModel: NavigationViewModel
    var artwork: Artwork
    
    init(_ artwork: Artwork) {
        self.artwork = artwork
    }
    
    var body: some View {
        VStack {
            NavigationBack()
            VStack(alignment: .leading, spacing: 8) {
                Text(artwork.title)
                    .font(.headline)
                Text("Artist - " + artwork.artistDisplay)
                    .font(.subheadline)
                Text("Place - " + artwork.placeOfOrigin)
                    .font(.callout)
            }.padding(.horizontal, 16)
            Spacer()
        }
        
    }
}
