//
//  SupplementEditorInput.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

protocol CustomizableSupplementEditorViewModel: AnyObject {
    
    var output: SupplementEditorOutput? { get set }
    
    var supplement: AidKitSupplement! { get set }
}
