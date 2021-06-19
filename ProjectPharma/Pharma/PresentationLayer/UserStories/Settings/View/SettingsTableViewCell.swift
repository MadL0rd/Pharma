//
//  SettingsTableViewCell.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private var animationStartTime = Date()

//    var backgroundViewSelected = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func setContent(_ content: MenuRow) {
        imageView?.image = content.image
        textLabel?.text = content.title
        
        setDisclosure(toColour: .res.tintDark()!)
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        layer.masksToBounds = true
        backgroundColor = .res.background()
        imageView?.tintColor = .res.tintMain()
        textLabel?.font = .res.gilroyBold(size: 14)
        textLabel?.textColor = .res.tintDark()
        accessoryType = .disclosureIndicator
        imageView?.contentMode = .scaleAspectFit
        
        let clearView = UIView()
        clearView.backgroundColor = .clear
        selectedBackgroundView = clearView
                
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
