//
//  SupplementEditorView.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class SupplementEditorView: UIView {

    let scroll = UIScrollView()
    let stack = UIStackView()
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let infoLabel = UILabel()

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
        
        stack.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        
        stack.addArrangedSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .res.tintDark()
        titleLabel.font = .res.gilroyBold(size: 24)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        stack.addArrangedSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = .res.tintDark()
        infoLabel.font = .res.gilroyRegular(size: 16)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .left

        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scroll.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            scroll.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),

            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),

            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
}
