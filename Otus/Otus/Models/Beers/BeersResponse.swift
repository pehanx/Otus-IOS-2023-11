//
//  BeersResponse.swift
//  Otus
//
//  Created by Nikita Spekhin on 08.02.2024.
//

import Foundation

typealias BeersResponse = [Beer]

struct Beer: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageURL = "image_url"
    }
}
