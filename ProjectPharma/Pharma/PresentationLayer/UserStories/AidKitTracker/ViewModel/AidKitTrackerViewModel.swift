//
//  AidKitTrackerViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class AidKitTrackerViewModel {
    
	var output: AidKitTrackerOutput?
    
}

// MARK: - Configuration
extension AidKitTrackerViewModel: CustomizableAidKitTrackerViewModel {

}

// MARK: - Interface for view
extension AidKitTrackerViewModel: AidKitTrackerViewModelProtocol {

}

