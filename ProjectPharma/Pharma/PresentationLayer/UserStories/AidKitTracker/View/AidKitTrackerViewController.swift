//
//  AidKitTrackerViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class AidKitTrackerViewController: UIViewController {

    var viewModel: AidKitTrackerViewModelProtocol!
    var coordinator: AidKitTrackerCoordinatorProtocol!
    
    private var _view: AidKitTrackerView {
        return view as! AidKitTrackerView
    }

    override func loadView() {
        self.view = AidKitTrackerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        
    }
}