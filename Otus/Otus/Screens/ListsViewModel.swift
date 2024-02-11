//
//  ListsViewModel.swift
//  Otus
//
//  Created by Nikita Spekhin on 11.02.2024.
//

import SwiftUI

class ListsViewModel: ObservableObject {
    @Published var selectedType: ListsType = .artworks
}

