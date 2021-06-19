//  PharmaRoutes.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Alamofire

enum PharmaRoutes: String, URLConvertible {
    
    static let endpoint = "http://5.63.155.51:8000/api/"
    
    case supplements = "bads/"
    case supplementComponents = "drug_kinds/"
    case supplementCategories = "category_kinds/"

    func asURL() throws -> URL {
        guard let url = URL(string: PharmaRoutes.endpoint + self.rawValue)
        else { throw RequestBuildError.cannotCreateUrl }
        return url
    }
    
    static func makeAuthHeadersFromToken(token: String, contentType: ContentType? = nil) -> HTTPHeaders {
        if let contentType = contentType {
            return [
                "Authorization": "Token \(token)",
                "Content-Type": contentType.rawValue
            ]
        } else {
            return ["Authorization": "Token \(token)"]
        }
    }
}

enum ContentType: String {
    case json = "application/json"
    case formData = "multipart/form-data"
}
