//
//  NewsResponse.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
