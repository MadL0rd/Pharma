//
//  MainMenuViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class MainMenuViewModel {
	var output: MainMenuOutput?
    
    var supplementsManager: SupplementsManagerProtocol!

}

// MARK: - Configuration
extension MainMenuViewModel: CustomizableMainMenuViewModel {

}

// MARK: - Interface for view
extension MainMenuViewModel: MainMenuViewModelProtocol {

    func addSupplement(_ supplement: AidKitSupplement) {
        supplementsManager.addSupplement(supplement: supplement)
    }

}

