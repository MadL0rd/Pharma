//  PharmaNetworkServiceProtocol.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Foundation

protocol PharmaNetworkServiceProtocol: AnyObject {
    
    func searchSupplementByBarcode(code: String, completion: @escaping GetSupplementsCompletion)
}

