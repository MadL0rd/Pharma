//
//  ComponentTableViewCell.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import UIKit

class ComponentTableViewCell: UITableViewCell {
    
    let background = UIView()
    let title = UILabel()
    let substanceLabel = UILabel()
    let rateLabel = UILabel()
    let rateSubtitleLabel = UILabel()

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
    
    func setContent(_ content: SupplementComponent) {
        title.text = content.name
        substanceLabel.text = content.substance
        
        if let score = content.rating {
            rateLabel.isHidden = false
            rateSubtitleLabel.isHidden = false
            rateLabel.text = "\(Int(score))/5"
        } else {
            rateLabel.isHidden = true
            rateSubtitleLabel.isHidden = true
        }
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
        
        contentView.addSubview(substanceLabel)
        substanceLabel.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.labelSmall(substanceLabel)
        
        contentView.addSubview(rateLabel)
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.font = .res.gilroyBold(size: 14)
        rateLabel.textColor = .res.tintMain()
        
        addSubview(rateSubtitleLabel)
        rateSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        UIStyleManager.labelSmall(rateSubtitleLabel)
        rateSubtitleLabel.text = .res.supplementComponentRateSubitle()
                
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 64),
            
            background.centerYAnchor.constraint(equalTo: centerYAnchor),
            background.centerXAnchor.constraint(equalTo: centerXAnchor),
            background.widthAnchor.constraint(equalTo: widthAnchor),
            background.heightAnchor.constraint(equalTo: heightAnchor, constant: -10),
            
            title.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            title.leftAnchor.constraint(equalTo: background.leftAnchor, constant: 18),
            title.rightAnchor.constraint(equalTo: background.rightAnchor, constant: -18),
            
            substanceLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -16),
            substanceLabel.leftAnchor.constraint(equalTo: background.leftAnchor, constant: 18),
            
            rateLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -16),
            rateLabel.rightAnchor.constraint(equalTo: background.rightAnchor, constant: -18),
            
            rateSubtitleLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -16),
            rateSubtitleLabel.rightAnchor.constraint(equalTo: rateLabel.leftAnchor, constant: -12)
        ])
    }
}

