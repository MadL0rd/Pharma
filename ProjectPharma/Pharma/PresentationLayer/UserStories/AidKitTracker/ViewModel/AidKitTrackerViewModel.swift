//
//  AidKitTrackerViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class AidKitTrackerViewModel {
    
	var output: AidKitTrackerOutput?
    
    var supplementsManager: SupplementsManagerProtocol!
}

// MARK: - Configuration
extension AidKitTrackerViewModel: CustomizableAidKitTrackerViewModel {

}

// MARK: - Interface for view
extension AidKitTrackerViewModel: AidKitTrackerViewModelProtocol {
    
    var supplements: [AidKitSupplement] {
        supplementsManager.supplements
    }
    
}

