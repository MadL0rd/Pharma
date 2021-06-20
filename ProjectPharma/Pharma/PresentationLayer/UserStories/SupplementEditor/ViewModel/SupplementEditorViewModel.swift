//
//  SupplementEditorViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class SupplementEditorViewModel {
	var output: SupplementEditorOutput?
    
    var supplement: SupplementInputData!
}

// MARK: - Configuration
extension SupplementEditorViewModel: CustomizableSupplementEditorViewModel {

}

// MARK: - Interface for view
extension SupplementEditorViewModel: SupplementEditorViewModelProtocol {

}

