//
//  UserHealthCoordinator.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class UserHealthCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableUserHealthViewModel) -> Void)? = nil) -> UIViewController {
        let view = UserHealthViewController()
        let viewModel = UserHealthViewModel()
        let coordinator = UserHealthCoordinator()

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
extension UserHealthCoordinator: UserHealthCoordinatorProtocol {

}