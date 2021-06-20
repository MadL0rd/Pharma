//
//  ComponentInfoInput.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

protocol CustomizableComponentInfoViewModel: AnyObject {
    
    var output: ComponentInfoOutput? { get set }
    
    var component: SupplementComponent! { get set }
}
