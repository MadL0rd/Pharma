//
//  SupplementEditorViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class SupplementEditorViewController: UIViewController {

    var viewModel: SupplementEditorViewModelProtocol!
    var coordinator: SupplementEditorCoordinatorProtocol!
    
    private var _view: SupplementEditorView {
        return view as! SupplementEditorView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .res.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }

    override func loadView() {
        self.view = SupplementEditorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        setupMedicine()
    }
    
    private func setupMedicine() {
        guard let supplement = viewModel.supplement
        else { return }
        
        _view.imageView.setDefaultLoadingInicator()
        _view.imageView.sd_setImage(with: URL(string: supplement.supplement.imageUrlString))
        
        _view.titleLabel.text = supplement.supplement.name
        _view.infoLabel.text = supplement.supplement.info
    }
}
