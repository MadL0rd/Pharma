//  PharmaRequestBuilder.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Alamofire

enum PharmaRequestBuilder {
    
    case supplementsSearchCode(code: String)
    case supplementComponents
    case supplementCategories
}

extension PharmaRequestBuilder: DataRequestExecutable {
    
    var execute: DataRequest {
        switch self {
        case .supplementsSearchCode(code: let code):
            let parameters: [String: Any] = [ "code": code ]
            return AF.request(PharmaRoutes.supplements, method: .get, parameters: parameters)
            
        case .supplementComponents:
            return AF.request(PharmaRoutes.supplementComponents, method: .get)

        case .supplementCategories:
            return AF.request(PharmaRoutes.supplementCategories, method: .get)

        }
    }
}
