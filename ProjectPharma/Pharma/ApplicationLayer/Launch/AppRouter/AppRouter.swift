//
//  AppRouter.swift
//  Pharma
//
//  Created by Anton Tekutov on 19.06.21.
//

import UIKit

protocol AppRouter: AnyObject {

	var window: UIWindow! { get set }
    
    func handleLaunch()
}
