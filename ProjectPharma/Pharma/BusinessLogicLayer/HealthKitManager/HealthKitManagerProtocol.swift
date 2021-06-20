//
//  HealthKitManagerProtocol.swift
//  Pharma
//
//  Created by Антон Текутов on 20.06.2021.
//

import Foundation

protocol HealthKitManagerProtocol {
    
    func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Void)
    func loadUserHealthProfile(completion: @escaping (UserHealthProfile) -> Void)
}
