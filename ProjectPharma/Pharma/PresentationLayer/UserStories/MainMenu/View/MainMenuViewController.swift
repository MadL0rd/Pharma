//
//  MainMenuViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class MainMenuViewController: UITabBarController, TabBarModuleTransitionHandler {

    var viewModel: MainMenuViewModelProtocol!
    var coordinator: MainMenuCoordinatorProtocol!
    
    private var appearFirstTime = true
    
    private let bar = CustomTabBar(frame: .zero)
    private let tabBarItemInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    private let defaultSelecttedIndex = 1
    private let duration: TimeInterval = 0.7
    override var selectedIndex: Int {
        didSet {
            bar.setSelectedIndex(index: selectedIndex, animated: false)
        }
    }
    
    //viewDidLoad called just in time with init - feature of UITabBarController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if appearFirstTime {
            appearFirstTime = false
            DispatchQueue.main.async { [ weak self ] in
                self?.configureSelf()
            }
        }
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .res.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    // navigation bar hide/show
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Private setup methods
    
    func configureSelf() {
        
        setupCustomTabBar()
        
        let shopVc = coordinator.generateShopModule()
        let aidKitVc = coordinator.generateAidKitModule()
        let userHealthVc = coordinator.generateUserHealthModule()
        let settingsVc = coordinator.generateSettingsModule()

        setViewControllers([shopVc, aidKitVc, userHealthVc, settingsVc], animated: false)
        selectedIndex = defaultSelecttedIndex
        bar.refreshSelection(animated: false)
        
        bar.addMedsButton.addTarget(self, action: #selector(addButtonDidTapped(sender:)), for: .touchUpInside)
    }
    
    private func setupCustomTabBar() {
        tabBar.isHidden = true
        
        view.addSubview(bar)
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.selectionDelegate = self
        
        NSLayoutConstraint.activate([
            bar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5),
            bar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -5),
            bar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5),
            bar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -UIConstants.customTabBarHeight + 5)
        ])
    }
    
    // MARK: - UI elements actions

    @objc private func addButtonDidTapped(sender: UIButton) {
        sender.tapAnimation()
        VibroGenerator.light.impactOccurred()
        DispatchQueue.main.async { [ weak self ] in
            guard let self = self
            else { return }
            self.coordinator.openModuleWithOutput(.barcodeMedsScaner(output: self))
        }
    }
}

// MARK: - CustomTabBarSelectionDelegate

extension MainMenuViewController: CustomTabBarSelectionDelegate {
    
    func selectionDidChange(oldSelectedIndex: Int, newSelectedIndex: Int) {
        selectedIndex = newSelectedIndex
    }
}

// MARK: - CustomTabBarSelectionDelegate

extension MainMenuViewController: BarcodeMedsScanerOutput {
    
    func returnSupplement(_ supplement: AidKitSupplement) {
        viewModel.addSupplement(supplement)
        coordinator.openSupplementEditor(supplement: supplement)
    }
}
