//
//  SupplementEditorCoordinator.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class SupplementEditorCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableSupplementEditorViewModel) -> Void)? = nil) -> UIViewController {
        let view = SupplementEditorViewController()
        let viewModel = SupplementEditorViewModel()
        let coordinator = SupplementEditorCoordinator()

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
extension SupplementEditorCoordinator: SupplementEditorCoordinatorProtocol {

}