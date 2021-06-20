//
//  SupplementEditorView.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class SupplementEditorView: UIView {
    
    let iHerbLinkButton = ButtonWithTouchSize()
    
    let scroll = UIScrollView()
    let stack = UIStackView()
    
    let mainInfo = SupplementMainInfoView()
    let compositionTitle = UILabel()
    let preInfoTitleLabel = UILabel()
    let tagsLabel = UILabel()
    let infoLabel = UILabel()

    let componentsTable = ContentFittingTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func setSupplement(_ content: Supplement) {
        preInfoTitleLabel.text = content.name
        infoLabel.text = content.info

        var tags = ""
        content.categories.forEach {
            tags += "#\($0) "
        }
        tagsLabel.text = tags
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        setupIHerbLinkButton()
        
        addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .leading
        
        stack.addArrangedSubview(mainInfo)
        
        stack.addArrangedSubview(compositionTitle)
        compositionTitle.text = .res.supplementCompositionTitle()
        UIStyleManager.labelH2(compositionTitle)
        
        stack.addArrangedSubview(componentsTable)
        componentsTable.translatesAutoresizingMaskIntoConstraints = false
        componentsTable.separatorColor = .clear
        componentsTable.backgroundColor = .res.background()
        componentsTable.showsVerticalScrollIndicator = false
        componentsTable.estimatedRowHeight = 66
        componentsTable.isScrollEnabled = false
        componentsTable.rowHeight = UITableView.automaticDimension
        componentsTable.register(ComponentTableViewCell.self,
                                 forCellReuseIdentifier: ComponentTableViewCell.identifier)
        
        stack.addArrangedSubview(preInfoTitleLabel)
        UIStyleManager.labelH2(preInfoTitleLabel)
        
        stack.addArrangedSubview(tagsLabel)
        tagsLabel.textColor = .res.tintMain()
        tagsLabel.font = .res.gilroyRegular(size: 12)
        tagsLabel.numberOfLines = 0
        
        stack.addArrangedSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = .res.tintDark()
        infoLabel.font = .res.gilroyRegular(size: 12)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .left
        
        makeConstraints()
    }
    
    private func setupIHerbLinkButton() {
        iHerbLinkButton.frame = CGRect(x: 0,
                                       y: 0,
                                       width: 24,
                                       height: 24)
        iHerbLinkButton.setImage(.res.iherbLinkButton(), for: .normal)
        iHerbLinkButton.setImage(.res.iherbLinkButton(), for: .selected)
        iHerbLinkButton.setImage(.res.iherbLinkButton(), for: .highlighted)
        iHerbLinkButton.setDefaultAreaPadding()
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
            
            componentsTable.widthAnchor.constraint(equalTo: stack.widthAnchor),
            componentsTable.centerXAnchor.constraint(equalTo: stack.centerXAnchor)
        ])
    }
}
