//
//  SupplementComponent.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Foundation

struct SupplementComponent: Codable {
    
    let id: Int
    let articles: [Article]
    let name: String
    let substance: String?
    let rating: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case articles = "articles"
        case name = "name"
        case substance = "count"
        case rating = "rating"
    }
}
