//
//  UIStyleManager.swift
//  Pharma
//
//  Created by Anton Tekutov on 19.06.21.
//

import UIKit

class UIStyleManager {
    
    // MARK: - UIView
    
    static func textDefaultInput(_ view: UIView, addHeightConstraint: Bool = true) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = .res.backgroundControl()

        guard addHeightConstraint
        else { return }
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    static func shadow(_ view: UIView) {
        view.layer.shadowColor = UIColor.res.tintDark()?.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    // MARK: - UINavigationController
    
    static func navigationControllerTransparent(_ controller: UINavigationController) {
        controller.view.backgroundColor = .clear
        controller.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        controller.navigationBar.shadowImage = UIImage()
        controller.navigationBar.isTranslucent = true
    }
    
    // MARK: - UITextField
    
    static func textFieldDefault(textField: UITextField, placeholderText: String) {
        textDefaultInput(textField)
        textField.font = .res.gilroyBold(size: 14)
        textField.setLeftPaddingPoints(24)
        textField.setRightPaddingPoints(24)

        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.res.tintGray()!,
            NSAttributedString.Key.font: UIFont.res.gilroyRegular(size: 14)!
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                             attributes: attributes)
    }
    
    // MARK: - UILabel
    
    static func labelH1(_ label: UILabel) {
        label.textColor = .res.tintDark()
        label.font = .res.gilroyBold(size: 18)
        label.numberOfLines = 0
    }
    
    static func labelH2(_ label: UILabel) {
        label.textColor = .res.tintDark()
        label.font = .res.gilroyBold(size: 16)
        label.numberOfLines = 0
    }
    
    static func labelH3(_ label: UILabel) {
        label.textColor = .res.tintDark()
        label.font = .res.gilroySemibold(size: 14)
        label.numberOfLines = 0
    }
    
    static func labelSmall(_ label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .res.tintGrayPale()
        label.font = .res.gilroyRegular(size: 10)
        label.numberOfLines = 1
        label.textAlignment = .left
    }
}
