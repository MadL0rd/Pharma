//
//  BarcodeMedsScanerCoordinator.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class BarcodeMedsScanerCoordinator: DefaultCoordinator {
    
    static func createModule(_ configuration: ((CustomizableBarcodeMedsScanerViewModel) -> Void)? = nil) -> UIViewController {
        let view = BarcodeMedsScanerViewController()
        let viewModel = BarcodeMedsScanerViewModel()
        let coordinator = BarcodeMedsScanerCoordinator()

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
extension BarcodeMedsScanerCoordinator: BarcodeMedsScanerCoordinatorProtocol {

}
