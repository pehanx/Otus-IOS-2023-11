//
//  Article.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import Foundation

struct Article: Identifiable, Codable {
    var id: String {
        "\(title)_\(publishedAt ?? "")"
    }
    let author: String?
    let title: String
	let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String
}
