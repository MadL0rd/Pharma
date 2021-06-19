//
//  ShopSearchCoordinator.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class ShopSearchCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableShopSearchViewModel) -> Void)? = nil) -> UIViewController {
        let view = ShopSearchViewController()
        let viewModel = ShopSearchViewModel()
        let coordinator = ShopSearchCoordinator()

        view.viewModel = viewModel
        view.coordinator = coordinator

        coordinator.transition = view

        if let configuration = configuration {
            configuration(viewModel)
        }

        return view
    }
}

// MARK: - Interface for view
extension ShopSearchCoordinator: ShopSearchCoordinatorProtocol {

}