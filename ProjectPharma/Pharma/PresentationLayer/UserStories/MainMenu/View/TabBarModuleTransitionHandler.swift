//
//  TabBarModuleTransitionHandler.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Foundation

protocol TabBarModuleTransitionHandler: ModuleTransitionHandler {
    
    var selectedIndex: Int { get set }
}
