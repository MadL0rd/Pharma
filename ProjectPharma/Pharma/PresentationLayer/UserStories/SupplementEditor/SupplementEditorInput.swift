//
//  SupplementEditorInput.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

enum SupplementInputData {
    case aidKitSupplement(supplementAidKit: AidKitSupplement)
    case supplement(supplement: Supplement)
}

protocol CustomizableSupplementEditorViewModel: AnyObject {
    
    var output: SupplementEditorOutput? { get set }
    
    var supplement: SupplementInputData! { get set }
}
