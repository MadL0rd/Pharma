//
//  BarcodeMedsScanerViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class BarcodeMedsScanerViewModel {
	var output: BarcodeMedsScanerOutput?
    
    var networkService: PharmaNetworkServiceProtocol!
}

// MARK: - Configuration
extension BarcodeMedsScanerViewModel: CustomizableBarcodeMedsScanerViewModel {

}

// MARK: - Interface for view
extension BarcodeMedsScanerViewModel: BarcodeMedsScanerViewModelProtocol {

    func findSupplement(barcode: String, completion: @escaping(Supplement?) -> Void) {
        networkService.searchSupplementByBarcode(code: barcode) { result in
            switch result {
            case .success(let data):
                completion(data.results.first)
                
            case .failure(let error):
                print(error)
                completion(nil)
            }
            
        }
    }

}

