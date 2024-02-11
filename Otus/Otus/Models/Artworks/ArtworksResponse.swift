//
//  ArtworksResponse.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import Foundation

struct ArtworksResponse: Codable {
    let pagination: ArtworksPagination
    let data: [Artwork]
}
