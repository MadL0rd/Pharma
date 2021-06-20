//
//  ComponentInfoView.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

final class ComponentInfoView: UIView {
    
    let scroll = UIScrollView()
    let stack = UIStackView()
    
    let title = UILabel()
    let articlesTable = ContentFittingTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        
        stack.addArrangedSubview(title)
        UIStyleManager.labelH1(title)
        title.textAlignment = .center
        
        stack.addArrangedSubview(articlesTable)
        articlesTable.translatesAutoresizingMaskIntoConstraints = false
        articlesTable.separatorColor = .clear
        articlesTable.backgroundColor = .res.background()
        articlesTable.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 30, right: 0)
        articlesTable.showsVerticalScrollIndicator = false
        articlesTable.estimatedRowHeight = 66
        articlesTable.isScrollEnabled = false
        articlesTable.rowHeight = UITableView.automaticDimension
        articlesTable.register(ArticleTableViewCell.self,
                               forCellReuseIdentifier: ArticleTableViewCell.identifier)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            scroll.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            scroll.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            
            articlesTable.widthAnchor.constraint(equalTo: stack.widthAnchor),
            articlesTable.centerXAnchor.constraint(equalTo: stack.centerXAnchor)
        ])
    }
}
