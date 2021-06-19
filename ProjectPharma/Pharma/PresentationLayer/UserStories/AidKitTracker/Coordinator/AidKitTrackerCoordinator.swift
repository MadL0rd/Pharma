//
//  AidKitTrackerCoordinator.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class AidKitTrackerCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableAidKitTrackerViewModel) -> Void)? = nil) -> UIViewController {
        let view = AidKitTrackerViewController()
        let viewModel = AidKitTrackerViewModel()
        let coordinator = AidKitTrackerCoordinator()

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
extension AidKitTrackerCoordinator: AidKitTrackerCoordinatorProtocol {

}