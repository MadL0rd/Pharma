//
//  MainMenuCoordinatorProtocol.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

protocol MainMenuCoordinatorProtocol: DefaultCoordinatorProtocol {
    
    func generateShopModule() -> UIViewController
    func generateAidKitModule() -> UIViewController
    func generateUserHealthModule() -> UIViewController
    func generateSettingsModule() -> UIViewController
    func openSupplementEditor(supplement: AidKitSupplement)
}
