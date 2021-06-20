//
//  BarcodeMedsScanerViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit
import BarcodeScanner

final class BarcodeMedsScanerViewController: UIViewController {

    var viewModel: BarcodeMedsScanerViewModelProtocol!
    var coordinator: BarcodeMedsScanerCoordinatorProtocol!
    
    let barcodeViewController = BarcodeScannerViewController()
    
    private var _view: BarcodeMedsScanerView {
        return view as! BarcodeMedsScanerView
    }

    override func loadView() {
        self.view = BarcodeMedsScanerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        barcodeViewController.codeDelegate = self
        barcodeViewController.errorDelegate = self
        barcodeViewController.dismissalDelegate = self
        
        addChildViewControllerToView(vc: barcodeViewController, into: _view.scanerContainer)
    }
}

// MARK: - BarcodeScannerCodeDelegate

extension BarcodeMedsScanerViewController: BarcodeScannerCodeDelegate {
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print("code: \(code)\ntype: \(type)")
        
        viewModel.findSupplement(barcode: code) { [ weak self ] supplement in
            guard let self = self,
                  let supplement = supplement
            else {
                controller.resetWithError(message: .res.barcodeScanerSupplementNotFound())
                return
            }
            
            let data = AidKitSupplement(id: 1,
                                        supplement: supplement,
                                        shelfLifeDate: nil,
                                        itemsCount: supplement.tabletsCountInt ?? 0)
            DispatchQueue.main.async {
                self.barcodeViewController.reset()
                AlertManager.showSuccessHUD(on: self.navigationController!.view)
                self.viewModel.output?.returnSupplement(data)
            }
        }
    }
}

// MARK: - BarcodeScannerErrorDelegate

extension BarcodeMedsScanerViewController: BarcodeScannerErrorDelegate {
    
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

// MARK: - BarcodeScannerDismissalDelegate

extension BarcodeMedsScanerViewController: BarcodeScannerDismissalDelegate {
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        
    }
}

