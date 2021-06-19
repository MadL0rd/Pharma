//
//  SettingsViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Foundation
import StoreKit

final class SettingsViewModel {
    
	var output: SettingsOutput?
    
}

// MARK: - Configuration
extension SettingsViewModel: CustomizableSettingsViewModel {

}

// MARK: - Interface for view
extension SettingsViewModel: SettingsViewModelProtocol {

//    var termsOfUsageUrl: URL? {
//        return purchaseManager.termsOfUsageUrl
//    }
//    var privacyPolicyUrl: URL? {
//        return purchaseManager.privacyPolicyUrl
//    }
//    var supportUrl: URL? {
//        return purchaseManager.supportUrl
//    }
//
//    func rateApp() {
//        purchaseManager.rateApp()
//    }
    
}
