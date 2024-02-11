//
//  Artwork.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import Foundation

struct Artwork: Identifiable, Codable {
    let id: Int
    let title: String
    let thumbnail: ArtworkThumbnail
    let mainReferenceNumber: String
    let dateDisplay: String
	let artistDisplay: String
    let placeOfOrigin: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case mainReferenceNumber = "main_reference_number"
        case dateDisplay = "date_display"
        case artistDisplay = "artist_display"
        case placeOfOrigin = "place_of_origin"
    }
}

struct ArtworkThumbnail: Codable {
    let lqip: String
}
