//
//  BarcodeMedsScanerInput.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

protocol CustomizableBarcodeMedsScanerViewModel: AnyObject {
    
    var output: BarcodeMedsScanerOutput? { get set }
}
