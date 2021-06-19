//
//  SettingsView.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class SettingsView: UIView {
    
    let title = UILabel()
    let tableView = UITableView()
    let footer = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
    let footerLabel = UILabel()

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
        
        addSubview(tableView)
        tableView.separatorColor = .clear
        tableView.backgroundColor = .res.background()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = footer
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 64
        
        setupFooter()
        setupTitle()
        
        makeConstraints()
    }
    
    private func setupTitle() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = .res.settingsTitle()
        title.font = .res.gilroyBold(size: 18)
        title.textColor = .res.tintDark()
    }
    
    private func setupFooter() {
        footer.addSubview(footerLabel)
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.font = .res.gilroyRegular(size: 14)
        footerLabel.textAlignment = .center
        footerLabel.numberOfLines = 0
        footerLabel.textColor = .res.tintGray()
        footerLabel.text = "\(R.string.localizable.settingsVersion()): \(Bundle.main.versionNumber)"
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: topAnchor, constant: UIConstants.navigationBarCenterY),
            title.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            
            footerLabel.topAnchor.constraint(equalTo: footer.topAnchor, constant: 20),
            footerLabel.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            footerLabel.widthAnchor.constraint(equalTo: tableView.widthAnchor, multiplier: 0.9)
        ])
    }
}
