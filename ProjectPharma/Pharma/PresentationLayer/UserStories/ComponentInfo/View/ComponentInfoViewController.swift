//
//  ComponentInfoViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

final class ComponentInfoViewController: UIViewController {

    var viewModel: ComponentInfoViewModelProtocol!
    var coordinator: ComponentInfoCoordinatorProtocol!
    
    private var _view: ComponentInfoView {
        return view as! ComponentInfoView
    }
    
    var articles: [Article] {
        return viewModel.component.articles
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .res.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }

    override func loadView() {
        self.view = ComponentInfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        
        _view.articlesTable.dataSource = self
        _view.articlesTable.delegate = self

        setupContent()
    }
    
    private func setupContent() {
        guard let content = viewModel.component
        else { return }
        
        _view.title.text = content.name
    }
}

// MARK: - Articles table management

extension ComponentInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier,
                                                 for: indexPath) as! ArticleTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let content = articles[exist: indexPath.row] {
            cell.setContent(content)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.tapAnimation()
        if let content = articles[exist: indexPath.row],
           let url = URL(string: content.link) {
            UIApplication.shared.open(url)
        }
    }
}
