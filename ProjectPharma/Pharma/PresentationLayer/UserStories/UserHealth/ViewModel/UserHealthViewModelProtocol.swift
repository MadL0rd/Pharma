//
//  UserHealthViewModelProtocol.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

protocol UserHealthViewModelProtocol: AnyObject {
    
    func authorizeHealthKit(completion: @escaping () -> Void)
    func loadUserHealthProfile(completion: @escaping (UserHealthProfile) -> Void)
}
