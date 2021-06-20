//
//  ComponentInfoCoordinator.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

final class ComponentInfoCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableComponentInfoViewModel) -> Void)? = nil) -> UIViewController {
        let view = ComponentInfoViewController()
        let viewModel = ComponentInfoViewModel()
        let coordinator = ComponentInfoCoordinator()

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
extension ComponentInfoCoordinator: ComponentInfoCoordinatorProtocol {

}