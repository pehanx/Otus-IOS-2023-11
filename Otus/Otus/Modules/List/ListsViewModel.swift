//
//  ListsViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 11.02.2024.
//

import SwiftUI

class ListsViewModel: ObservableObject {
    @Published var selectedType: ListsType = .artworks
    @Published var artworksViewModel = ArtworksViewModel()
    @Published var newsViewModel = NewsViewModel()
    @Published var beersViewModel = BeersViewModel()
}

