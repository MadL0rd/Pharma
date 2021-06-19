//
//  UserHealthViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class UserHealthViewController: UIViewController {

    var viewModel: UserHealthViewModelProtocol!
    var coordinator: UserHealthCoordinatorProtocol!
    
    private var _view: UserHealthView {
        return view as! UserHealthView
    }

    override func loadView() {
        self.view = UserHealthView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        
    }
}