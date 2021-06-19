//
//  ShopSearchViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class ShopSearchViewController: UIViewController {

    var viewModel: ShopSearchViewModelProtocol!
    var coordinator: ShopSearchCoordinatorProtocol!
    
    private var _view: ShopSearchView {
        return view as! ShopSearchView
    }

    override func loadView() {
        self.view = ShopSearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        
    }
}