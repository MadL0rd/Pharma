//
//  AidKitTrackerView.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class AidKitTrackerView: UIView {
    
    let title = UILabel()
    
    let scroll = UIScrollView()
    let stack = UIStackView()
    
    let groupsMockUpImage = UIImageView(image: .res.groupsMockUp())
    
    let recomendationImageMockUp = UIImageView(image: .res.recomendationImageMockUp())
    let tableTitle = UILabel()
    
    let supplementAidKitTable = ContentFittingTableView()
    
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
        title.text = .res.aidKitTitle()
        title.font = .res.gilroyBold(size: 18)
        title.textColor = .res.tintDark()
        title.textAlignment = .left
        
        addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .leading
        
        scroll.addSubview(groupsMockUpImage)
        groupsMockUpImage.translatesAutoresizingMaskIntoConstraints = false
        groupsMockUpImage.contentMode = .scaleAspectFill
        
        stack.addArrangedSubview(recomendationImageMockUp)
        recomendationImageMockUp.translatesAutoresizingMaskIntoConstraints = false
        recomendationImageMockUp.contentMode = .scaleAspectFill
        
        stack.setCustomSpacing(30, after: recomendationImageMockUp)
        
        stack.addArrangedSubview(tableTitle)
        UIStyleManager.labelH2(tableTitle)
        tableTitle.text = "График приема БАДов"
        
        stack.addArrangedSubview(supplementAidKitTable)
        supplementAidKitTable.translatesAutoresizingMaskIntoConstraints = false
        supplementAidKitTable.separatorColor = .clear
        supplementAidKitTable.backgroundColor = .res.background()
        supplementAidKitTable.showsVerticalScrollIndicator = false
        supplementAidKitTable.estimatedRowHeight = 66
        supplementAidKitTable.isScrollEnabled = false
        supplementAidKitTable.rowHeight = UITableView.automaticDimension
        supplementAidKitTable.register(SupplementAidKitTableViewCell.self,
                                       forCellReuseIdentifier: SupplementAidKitTableViewCell.identifier)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: topAnchor, constant: UIConstants.navigationBarCenterY),
            title.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            scroll.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            scroll.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            
            groupsMockUpImage.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 18),
            groupsMockUpImage.leftAnchor.constraint(equalTo: scroll.leftAnchor),
            groupsMockUpImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.1),
            
            stack.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 216),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: -1.5 * UIConstants.customTabBarHeight),
            stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            
            recomendationImageMockUp.widthAnchor.constraint(equalTo: stack.widthAnchor),
            
            supplementAidKitTable.widthAnchor.constraint(equalTo: stack.widthAnchor),
            supplementAidKitTable.centerXAnchor.constraint(equalTo: stack.centerXAnchor)
        ])
    }
}
