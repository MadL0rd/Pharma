//
//  SupplementsManager.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Foundation

class SupplementsManager: SupplementsManagerProtocol {
    
    static let shared: SupplementsManagerProtocol = SupplementsManager()
    
    //        TODO: use realm to store data
    var supplements = [AidKitSupplement]()
    
    func addSupplement(supplement: AidKitSupplement) {
        supplements.append(supplement)
    }
    
    func removeSupplement(supplement: AidKitSupplement) {
        
    }
    
    func updateSupplement(supplement: AidKitSupplement) {
        
    }
}
