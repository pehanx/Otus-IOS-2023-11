//
//  ArtworksPagination.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import Foundation

struct ArtworksPagination: Codable {
    let total: Int
    let limit: Int
    let offset: Int
	let totalPages: Int
    let currentPage: Int
    let prevURL: String?
	let nextURL: String?

    enum CodingKeys: String, CodingKey {
        case total
        case limit
        case offset
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case prevURL = "prev_url"
        case nextURL = "next_url"
    }
}
