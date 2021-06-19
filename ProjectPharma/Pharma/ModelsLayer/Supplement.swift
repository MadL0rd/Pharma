//
//  Supplement.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Foundation

struct Supplement: Codable {
    
    let id: Int
    let components: [SupplementComponent]
    let name: String
    let barcode: String
    let tabletsCount: String?
    let imageUrlString: String
    let link: String
    let info: String
    let categories: [String]
    let rating: Double?
    
    var tabletsCountInt: Int? {
        guard let tabletsCount = tabletsCount
        else { return nil }
        var countString = ""
        tabletsCount.forEach {
            if $0.isNumber {
                countString += "\($0)"
            }
        }
        return Int(countString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case components = "drugs"
        case name = "name"
        case barcode = "qcode"
        case tabletsCount = "count"
        case imageUrlString = "img"
        case link = "link"
        case info = "info"
        case categories = "categories"
        case rating = "rating"
    }
}
