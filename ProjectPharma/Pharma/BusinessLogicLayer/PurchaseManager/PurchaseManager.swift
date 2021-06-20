//
//  PurchaseManager.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import StoreKit

class PurchaseManager: PurchaseManagerProtocol {
    
    static let shared: PurchaseManagerProtocol = PurchaseManager()
        
    var termsOfUsageUrl: URL? {
        return URL(string: "https://github.com/MadL0rd/Pharma")
    }
    var privacyPolicyUrl: URL? {
        return URL(string: "https://github.com/MadL0rd/Pharma")
    }
    
    var supportUrl: URL? {
        return URL(string: "https://github.com/MadL0rd/Pharma")
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}
