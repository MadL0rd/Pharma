//
//  BarcodeMedsScanerOutput.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

protocol BarcodeMedsScanerOutput: AnyObject {
    
    func returnSupplement(_ supplement: AidKitSupplement) 
}
