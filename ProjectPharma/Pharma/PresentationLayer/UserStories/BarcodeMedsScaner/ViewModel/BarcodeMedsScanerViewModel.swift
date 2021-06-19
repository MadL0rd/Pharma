//
//  BarcodeMedsScanerViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class BarcodeMedsScanerViewModel {
	var output: BarcodeMedsScanerOutput?
    
//    var networkService: MedsInfoNetworkServiceProtocol!
}

// MARK: - Configuration
extension BarcodeMedsScanerViewModel: CustomizableBarcodeMedsScanerViewModel {

}

// MARK: - Interface for view
extension BarcodeMedsScanerViewModel: BarcodeMedsScanerViewModelProtocol {

//    func findMeds(barcode: String, completion: @escaping FindMedsCompletion) {
//        networkService.findMedsByBarcode(barcode: barcode, completion: completion)
//    }
}

