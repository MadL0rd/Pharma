//
//  UserHealthView.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class UserHealthView: UIView {
    
    let title = UILabel()
    
    let scroll = UIScrollView()
    let stack = UIStackView()
    
    let userHealthTable = ContentFittingTableView()
    
    let permissionButton = ButtonWithTouchSize()
    
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
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = .res.userHealthTitle()
        title.font = .res.gilroyBold(size: 18)
        title.textColor = .res.tintDark()
        title.textAlignment = .left
        
        addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        
        stack.addArrangedSubview(title)
        UIStyleManager.labelH1(title)
        title.textAlignment = .left
        
        stack.addArrangedSubview(userHealthTable)
        userHealthTable.translatesAutoresizingMaskIntoConstraints = false
        userHealthTable.separatorColor = .clear
        userHealthTable.backgroundColor = .res.background()
        userHealthTable.showsVerticalScrollIndicator = false
        userHealthTable.estimatedRowHeight = 62
        userHealthTable.isScrollEnabled = false
        userHealthTable.rowHeight = UITableView.automaticDimension
        userHealthTable.register(UserHealthTableViewCell.self,
                                 forCellReuseIdentifier: UserHealthTableViewCell.identifier)
        
        stack.addArrangedSubview(permissionButton)
        permissionButton.backgroundColor = .res.tintMain()
        permissionButton.layer.cornerRadius = 20
        permissionButton.setTitle(.res.userHealthPermissionText(), for: .normal)
        permissionButton.setTitle(.res.userHealthPermissionText(), for: .selected)
        permissionButton.setTitle(.res.userHealthPermissionText(), for: .highlighted)
        permissionButton.titleLabel?.font = .res.gilroyBold(size: 16)
        permissionButton.titleLabel?.textColor = .res.tintLight()
        permissionButton.titleLabel?.numberOfLines = 0
        permissionButton.titleLabel?.textAlignment = .center

        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: topAnchor, constant: UIConstants.navigationBarCenterY),
            title.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scroll.topAnchor.constraint(equalTo: title.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            scroll.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            scroll.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            
            userHealthTable.widthAnchor.constraint(equalTo: stack.widthAnchor),
            userHealthTable.centerXAnchor.constraint(equalTo: stack.centerXAnchor),
            
            permissionButton.heightAnchor.constraint(equalTo: permissionButton.titleLabel!.heightAnchor, constant: 44),
            permissionButton.widthAnchor.constraint(equalTo: stack.widthAnchor)
        ])
    }
}
