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
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        
        addChildViewControllerToView(vc: viewController, into: _view.scanerContainer)
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
            
            controller.reset()
            AlertManager.showSuccessHUD(on: self.navigationController!.view)
            self.viewModel.output?.returnSupplement(AidKitSupplement(id: 1,
                                                                     supplement: supplement,
                                                                     shelfLifeDate: nil,
                                                                     itemsCount: supplement.tabletsCountInt ?? 0))
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

