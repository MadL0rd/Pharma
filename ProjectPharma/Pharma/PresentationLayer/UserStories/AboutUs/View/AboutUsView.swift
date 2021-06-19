//
//  AboutUsView.swift
//  Pharma
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class AboutUsView: UIView {
    
    let title = UILabel()
    
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
        title.text = .res.aboutUsTitle()
        title.font = .res.gilroyBold(size: 18)
        title.textColor = .res.tintDark()
        title.textAlignment = .center
        
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: topAnchor, constant: UIConstants.navigationBarCenterY),
            title.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            title.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
