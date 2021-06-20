//
//  MainMenuCoordinator.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class MainMenuCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableMainMenuViewModel) -> Void)? = nil) -> UIViewController {
        let view = MainMenuViewController()
        let viewModel = MainMenuViewModel()
        let coordinator = MainMenuCoordinator()

        view.viewModel = viewModel
        view.coordinator = coordinator

        coordinator.transition = view
        
        viewModel.supplementsManager = SupplementsManager.shared

        if let configuration = configuration {
            configuration(viewModel)
        }

        return view
    }
}

// MARK: - Interface for view
extension MainMenuCoordinator: MainMenuCoordinatorProtocol {
    
    func generateShopModule() -> UIViewController {
        let vc = ShopSearchCoordinator.createModule()
        return vc
    }

    func generateAidKitModule() -> UIViewController {
        let vc = AidKitTrackerCoordinator.createModule()
        return vc
    }
    
    func generateUserHealthModule() -> UIViewController {
        let vc = UserHealthCoordinator.createModule()
        return vc
    }
    
    func generateSettingsModule() -> UIViewController {
        let vc = SettingsCoordinator.createModule()
        return vc
    }
    
    func openSupplementEditor(supplement: AidKitSupplement) {
        let vc = SupplementEditorCoordinator.createModule { viewModel in
            viewModel.supplement = .aidKitSupplement(supplementAidKit: supplement)
        }
        transition.showInRootNavigationController(vc)
    }

}
