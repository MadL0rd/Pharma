//
//  SupplementAidKitTableViewCell.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

class SupplementAidKitTableViewCell: UITableViewCell {
    
    let background = UIView()
    let imageBackground = UIImageView(image: .res.supplementCellImageBackground())
    let imagePreview = UIImageView()
    let title = UILabel()
    let shelfLifeDateLabel = UILabel()

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
    
    func setContent(_ content: AidKitSupplement) {
        title.text = content.supplement.name
        imagePreview.sd_setImage(with: URL(string: content.supplement.imageUrlString))
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
        
        background.addSubview(imageBackground)
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.contentMode = .scaleAspectFill
        
        background.addSubview(imagePreview)
        imagePreview.translatesAutoresizingMaskIntoConstraints = false
        imagePreview.backgroundColor = .res.tintLight()
        imagePreview.layer.cornerRadius = 12
        imagePreview.layer.masksToBounds = true
        imagePreview.setDefaultLoadingInicator()
        
        background.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.labelH2(title)
        title.text = "CollagenUP – \n500 мг"
        title.numberOfLines = 2
        
        background.addSubview(shelfLifeDateLabel)
        UIStyleManager.labelSmall(shelfLifeDateLabel)
        shelfLifeDateLabel.text = "\(String.res.supplementScreenShelfLifeDate()) 22.07.2022"
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 64),
            
            background.centerYAnchor.constraint(equalTo: centerYAnchor),
            background.centerXAnchor.constraint(equalTo: centerXAnchor),
            background.widthAnchor.constraint(equalTo: widthAnchor),
            background.heightAnchor.constraint(equalTo: heightAnchor, constant: -12),
            
            imageBackground.leftAnchor.constraint(equalTo: background.leftAnchor, constant: -6),
            imageBackground.topAnchor.constraint(equalTo: background.topAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            imageBackground.widthAnchor.constraint(equalTo: imageBackground.heightAnchor, multiplier: 72 / 66),
            
            imagePreview.widthAnchor.constraint(equalToConstant: 42),
            imagePreview.heightAnchor.constraint(equalToConstant: 42),
            imagePreview.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            imagePreview.centerYAnchor.constraint(equalTo: background.centerYAnchor),

            title.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            title.leftAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: 12),
            title.rightAnchor.constraint(equalTo: background.rightAnchor, constant: -12),

            shelfLifeDateLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            shelfLifeDateLabel.leftAnchor.constraint(equalTo: title.leftAnchor)
        ])
    }
}

