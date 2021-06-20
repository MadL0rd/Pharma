//
//  UserHealthTableViewCell.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

struct UserHealthTableViewCellContent {
    
    let title: String
    let value: String
}

class UserHealthTableViewCell: UITableViewCell {
    
    let background = UIView()
    let title = UILabel()
    let value = UILabel()

    static var identifier: String {
        String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func setContent(_ content: UserHealthTableViewCellContent) {
        title.text = content.title
        value.text = content.value
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        let clearView = UIView()
        clearView.backgroundColor = .clear
        selectedBackgroundView = clearView
        
        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .res.backgroundControl()
        background.layer.cornerRadius = 20
        background.layer.masksToBounds = true
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.labelH3(title)
        
        contentView.addSubview(value)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.font = .res.gilroyRegular(size: 14)
        value.textColor = .res.tintMain()
        value.textAlignment = .right
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 48),
            
            background.centerYAnchor.constraint(equalTo: centerYAnchor),
            background.centerXAnchor.constraint(equalTo: centerXAnchor),
            background.widthAnchor.constraint(equalTo: widthAnchor),
            background.heightAnchor.constraint(equalTo: heightAnchor, constant: -10),
            
            title.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            title.leftAnchor.constraint(equalTo: background.leftAnchor, constant: 18),
            title.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.5),

            value.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            value.rightAnchor.constraint(equalTo: background.rightAnchor, constant: -18),
            value.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.3)
        ])
    }
}

