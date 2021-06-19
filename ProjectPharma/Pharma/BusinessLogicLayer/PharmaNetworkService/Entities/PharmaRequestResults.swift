//  PharmaRequestResults.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//
//  Codable result structures

import Foundation

struct SupplementsSearchResult: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Supplement]
}
