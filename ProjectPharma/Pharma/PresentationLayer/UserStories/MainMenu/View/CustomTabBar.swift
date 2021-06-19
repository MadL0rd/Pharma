//
//  CustomTabBar.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

protocol CustomTabBarSelectionDelegate: AnyObject {
    
    func selectionDidChange(oldSelectedIndex: Int, newSelectedIndex: Int)
}

class CustomTabBar: UIImageView {
    
    let buttonSideSize: CGFloat = 24
    
    let gradient = UIImageView(image: .res.tabBarTopGradient())
    var buttons = [ButtonWithTouchSize]()
    let barButtonImages: [UIImage?] = [
        .res.shopTabBarButton(),
        .res.aidKitTabBarButton(),
        .res.userHelthTabBarButton(),
        .res.settingsTabBarButton()
    ]
    
    let addMedsButton = ButtonWithTouchSize()
    let addButtonShadow = UIImageView(image: .res.addButtonShadow())
    
    var selectedIndex = -1 {
        didSet {
            selectionDelegate?.selectionDidChange(oldSelectedIndex: oldValue, newSelectedIndex: selectedIndex)
        }
    }
    var selectedColor = UIColor.res.tintDark()
    var unselectedColor: UIColor? {
        return .res.tintGrayPale()
    }
    var duration: TimeInterval = 0.2
    weak var selectionDelegate: CustomTabBarSelectionDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public methods
    
    func setSelectedIndex(index: Int, animated: Bool = true) {
        guard index >= 0,
              index < buttons.count,
              selectedIndex != index
        else { return }
        selectedIndex = index
    }
    
    func refreshSelection(animated: Bool = true) {
        for i in buttons.indices {
            if i == selectedIndex {
                makeButtonSelected(button: buttons[i], animated: animated)
            } else {
                makeButtonUnselected(button: buttons[i], animated: animated)
            }
        }
    }
    
    // MARK: - UI elements actions
    
    @objc private func buttonTapped(button: ButtonWithTouchSize) {
        button.tapAnimation()
        guard let index = buttons.firstIndex(of: button),
              index != selectedIndex
        else { return }
        setSelectedIndex(index: index)
        refreshSelection()
    }
    
    // MARK: - Private setup methods
    
    private func setupView() {
        
        isUserInteractionEnabled = true
        
        backgroundColor = .res.tintLight()
        
        addSubview(gradient)
        gradient.translatesAutoresizingMaskIntoConstraints = false
        gradient.isUserInteractionEnabled = false
        
        addSubview(addButtonShadow)
        addButtonShadow.translatesAutoresizingMaskIntoConstraints = false
        addButtonShadow.contentMode = .scaleToFill
        
        setupButtons()
        
        addSubview(addMedsButton)
        addMedsButton.translatesAutoresizingMaskIntoConstraints = false
        addMedsButton.setDefaultAreaPadding()
        addMedsButton.setImage(.res.addButton(), for: .normal)
        addMedsButton.setImage(.res.addButton(), for: .highlighted)
        addMedsButton.setImage(.res.addButton(), for: .selected)

        makeConstraints()
    }
    
    private func setupButtons() {
        for i in barButtonImages.indices {
            let button = ButtonWithTouchSize()
            buttons.append(button)
            addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(barButtonImages[i], for: .normal)
            button.setImage(barButtonImages[i], for: .selected)
            button.setImage(barButtonImages[i], for: .highlighted)
            button.tintColor = selectedColor
            button.touchAreaPadding = UIEdgeInsets(top: 10, left: 35, bottom: 50, right: 35)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
        }
    }
    
    private func makeButtonSelected(button: ButtonWithTouchSize, animated: Bool = true) {
        let action = { [ weak self ] in
            button.tintColor = self?.selectedColor
        }
        if animated {
            UIView.animate(withDuration: duration, animations: action)
        } else {
            action()
        }
    }
    
    private func makeButtonUnselected(button: ButtonWithTouchSize, animated: Bool = true) {
        let action = { [ weak self ] in
            button.tintColor = self?.unselectedColor
        }
        if animated {
            UIView.animate(withDuration: duration, animations: action)
        } else {
            action()
        }
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            gradient.bottomAnchor.constraint(equalTo: topAnchor),
            gradient.centerXAnchor.constraint(equalTo: centerXAnchor),
            gradient.widthAnchor.constraint(equalTo: widthAnchor),
            gradient.heightAnchor.constraint(equalToConstant: 48),
            
            addMedsButton.widthAnchor.constraint(equalToConstant: 60),
            addMedsButton.heightAnchor.constraint(equalToConstant: 60),
            addMedsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addMedsButton.topAnchor.constraint(equalTo: topAnchor, constant: -18),
            
            addButtonShadow.widthAnchor.constraint(equalTo: addMedsButton.widthAnchor, multiplier: 1.8),
            addButtonShadow.heightAnchor.constraint(equalTo: addMedsButton.heightAnchor, multiplier: 1.4),
            addButtonShadow.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButtonShadow.centerYAnchor.constraint(equalTo: addMedsButton.centerYAnchor, constant: 16),

            buttons[1].widthAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[1].heightAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[1].topAnchor.constraint(equalTo: topAnchor, constant: 14),
            buttons[1].rightAnchor.constraint(equalTo: centerXAnchor, constant: -75),
            
            buttons[0].widthAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[0].heightAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[0].topAnchor.constraint(equalTo: topAnchor, constant: 14),
            buttons[0].rightAnchor.constraint(equalTo: buttons[1].leftAnchor, constant: -36),
            
            buttons[2].widthAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[2].heightAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[2].topAnchor.constraint(equalTo: topAnchor, constant: 14),
            buttons[2].leftAnchor.constraint(equalTo: centerXAnchor, constant: 75),
            
            buttons[3].widthAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[3].heightAnchor.constraint(equalToConstant: buttonSideSize),
            buttons[3].topAnchor.constraint(equalTo: topAnchor, constant: 14),
            buttons[3].leftAnchor.constraint(equalTo: buttons[2].rightAnchor, constant: 36)
        ])
    }
}

