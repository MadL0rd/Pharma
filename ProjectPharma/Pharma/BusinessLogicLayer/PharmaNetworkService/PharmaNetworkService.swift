//  PharmaNetworkService.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Alamofire

class PharmaNetworkService: NetworkService {
    
    static let shared: PharmaNetworkServiceProtocol = PharmaNetworkService()
    
    private let requestBuilder = PharmaRequestBuilder.self
}

extension PharmaNetworkService: PharmaNetworkServiceProtocol {
    
    func searchSupplementByBarcode(code: String, completion: @escaping GetSupplementsCompletion) {
        let request = requestBuilder.supplementsSearchCode(code: code)
        makeDefaultRequest(dataRequest: request, completion: completion)
    }
}
