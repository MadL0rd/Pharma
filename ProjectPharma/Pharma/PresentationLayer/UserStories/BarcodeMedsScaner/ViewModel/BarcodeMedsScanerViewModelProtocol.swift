//
//  BarcodeMedsScanerViewModelProtocol.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

protocol BarcodeMedsScanerViewModelProtocol: AnyObject {
    
    var output: BarcodeMedsScanerOutput? { get }
    
//    func findMeds(barcode: String, completion: @escaping FindMedsCompletion)
}
