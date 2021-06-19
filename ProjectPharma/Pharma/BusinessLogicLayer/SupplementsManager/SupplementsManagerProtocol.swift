//
//  SupplementsManagerProtocol.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Foundation

protocol SupplementsManagerProtocol {
    
    var supplements: [AidKitSupplement] { get }
    
    func addSupplement(supplement: AidKitSupplement)
    func removeSupplement(supplement: AidKitSupplement)
    func updateSupplement(supplement: AidKitSupplement)
}
