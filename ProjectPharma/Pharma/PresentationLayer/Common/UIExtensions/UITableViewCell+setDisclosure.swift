//
//  UITableViewCell+setDisclosure.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

extension UITableViewCell {

    func setDisclosure(toColour: UIColor) {
        for view in self.subviews {
            if let disclosure = view as? UIButton {
                if let image = disclosure.backgroundImage(for: .normal) {
                    let colouredImage = image.withRenderingMode(.alwaysTemplate)
                    disclosure.setImage(colouredImage, for: .normal)
                    disclosure.tintColor = toColour
                }
            }
        }
    }
}
