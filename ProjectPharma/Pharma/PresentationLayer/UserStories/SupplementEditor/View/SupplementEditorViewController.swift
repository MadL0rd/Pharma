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
    
    var supplement: Supplement? {
        guard let data = viewModel.supplement
        else { return nil }
        switch data {
        case .aidKitSupplement(supplementAidKit: let supplementAidKit):
            return supplementAidKit.supplement
            
        case .supplement(supplement: let supplement):
            return supplement
        }
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
        
        _view.iHerbLinkButton.addTarget(self, action: #selector(iHerbLinkButtonDidTapped(sender:)), for: .touchUpInside)
        let menuBarItem = UIBarButtonItem(customView: _view.iHerbLinkButton)
        navigationItem.rightBarButtonItem = menuBarItem
        
        _view.componentsTable.dataSource = self
        _view.componentsTable.delegate = self

        setupMedicine()
    }
    
    private func setupMedicine() {
        guard let supplementInput = viewModel.supplement,
              let supplement = supplement
        else { return }
        
        _view.mainInfo.setContent(supplementInput)
        _view.setSupplement(supplement) 
    }
    
    // MARK: - UI elements actions

    @objc private func iHerbLinkButtonDidTapped(sender: UIButton) {
        sender.tapAnimation()
        
        guard let supplementInput = viewModel.supplement
        else { return }
        
        var url: URL?
        switch supplementInput {
        
        case .aidKitSupplement(supplementAidKit: let supplementAidKit):
            url = URL(string: supplementAidKit.supplement.link)
            
        case .supplement(supplement: let supplement):
            url = URL(string: supplement.link)

        }
        guard let url = url
        else { return }
        UIApplication.shared.open(url)
    }
}

// MARK: - Components table management

extension SupplementEditorViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supplement?.components.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ComponentTableViewCell.identifier,
                                                 for: indexPath) as! ComponentTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let content = supplement?.components[exist: indexPath.row] {
            cell.setContent(content)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let component = supplement?.components[exist: indexPath.row],
              component.articles.isNotEmpty
        else {
            VibroGenerator.light.impactOccurred()
            tableView.cellForRow(at: indexPath)?.shake()
            return
        }
        
        coordinator.openComponentInfo(component: component)
        tableView.cellForRow(at: indexPath)?.tapAnimation()
    }
}
