//
//  SupplementMainInfoView.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

class SupplementMainInfoView: UIView {
    
    private var heightConstraint: NSLayoutConstraint!
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let shelfLifeDateLabel = UILabel()
    let countLabel = PaddingLabel(withInsets: 6, 6, 9, 9)
    
    let mockUpDay = UIImageView(image: .res.mockUpDay())
    let mockUpQuantity = UIImageView(image: .res.mockUpQuantity())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func setContent(_ content: SupplementInputData) {
        switch content {
        case .aidKitSupplement(supplementAidKit: let supplementAidKit):
            imageView.sd_setImage(with: URL(string: supplementAidKit.supplement.imageUrlString))
            
            titleLabel.text = supplementAidKit.supplement.name
            titleLabel.numberOfLines = 1
            
            shelfLifeDateLabel.isHidden = false
            shelfLifeDateLabel.text = .res.supplementScreenShelfLifeDate()
            if let date = supplementAidKit.shelfLifeDate {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"
                shelfLifeDateLabel.text? += " " + formatter.string(from: date)
            } else {
                shelfLifeDateLabel.text? += " 22.07.2022"
            }
            
            countLabel.isHidden = false
            countLabel.text = "\(supplementAidKit.itemsCount) \(String.res.supplementScreenPcs())"
            
            mockUpDay.isHidden = false
            mockUpQuantity.isHidden = false
            
            heightConstraint.constant = 140

        case .supplement(supplement: let supplement):
            imageView.sd_setImage(with: URL(string: supplement.imageUrlString))
            titleLabel.text = supplement.name
            titleLabel.numberOfLines = 4
            shelfLifeDateLabel.isHidden = true
            countLabel.isHidden = true
            mockUpDay.isHidden = true
            mockUpQuantity.isHidden = true
            
            heightConstraint.constant = 82
        }
    }
    
    // MARK: - UI elements actions

    @objc private func mockUpDidTapped(recognizer: UITapGestureRecognizer) {
        recognizer.view?.shake()
        VibroGenerator.heavy.impactOccurred()
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        backgroundColor = .res.background()
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.setDefaultLoadingInicator()
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.labelH1(titleLabel)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        
        addSubview(shelfLifeDateLabel)
        shelfLifeDateLabel.translatesAutoresizingMaskIntoConstraints = false
        shelfLifeDateLabel.textColor = .res.tintMain()
        shelfLifeDateLabel.font = .res.gilroyRegular(size: 10)
        shelfLifeDateLabel.numberOfLines = 1
        shelfLifeDateLabel.textAlignment = .left
        
        addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.backgroundColor = .res.tintMain()
        countLabel.textColor = .res.tintLight()
        countLabel.font = .res.gilroySemibold(size: 12)
        countLabel.numberOfLines = 1
        countLabel.textAlignment = .left
        countLabel.layer.cornerRadius = 12
        countLabel.layer.masksToBounds = true
        
        addSubview(mockUpDay)
        mockUpDay.translatesAutoresizingMaskIntoConstraints = false
        mockUpDay.contentMode = .scaleAspectFill
        mockUpDay.isUserInteractionEnabled = true
        var tap = UITapGestureRecognizer(target: self, action: #selector(mockUpDidTapped(recognizer:)))
        mockUpDay.addGestureRecognizer(tap)
        
        addSubview(mockUpQuantity)
        mockUpQuantity.translatesAutoresizingMaskIntoConstraints = false
        mockUpQuantity.contentMode = .scaleAspectFill
        mockUpQuantity.isUserInteractionEnabled = true
        tap = UITapGestureRecognizer(target: self, action: #selector(mockUpDidTapped(recognizer:)))
        mockUpQuantity.addGestureRecognizer(tap)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        heightConstraint = heightAnchor.constraint(equalToConstant: 82)
        NSLayoutConstraint.activate([
            heightConstraint,
            
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 82),
            imageView.heightAnchor.constraint(equalToConstant: 82),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 18),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            
            shelfLifeDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            shelfLifeDateLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            shelfLifeDateLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            countLabel.topAnchor.constraint(equalTo: shelfLifeDateLabel.bottomAnchor, constant: 9),
            countLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            
            mockUpQuantity.leftAnchor.constraint(equalTo: leftAnchor),
            mockUpQuantity.rightAnchor.constraint(equalTo: centerXAnchor, constant: -3),
            mockUpQuantity.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6),
            
            mockUpDay.leftAnchor.constraint(equalTo: centerXAnchor, constant: 3),
            mockUpDay.rightAnchor.constraint(equalTo: rightAnchor),
            mockUpDay.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6)
        ])
    }
}
