//
//  ComponentInfoViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

final class ComponentInfoViewModel {
	var output: ComponentInfoOutput?
    
    var component: SupplementComponent!
}

// MARK: - Configuration
extension ComponentInfoViewModel: CustomizableComponentInfoViewModel {

}

// MARK: - Interface for view
extension ComponentInfoViewModel: ComponentInfoViewModelProtocol {

}

