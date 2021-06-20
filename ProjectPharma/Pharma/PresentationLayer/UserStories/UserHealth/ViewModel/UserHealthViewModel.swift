//
//  UserHealthViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class UserHealthViewModel {
    var output: UserHealthOutput?
    
    var healthKitManager: HealthKitManagerProtocol!
}

// MARK: - Configuration
extension UserHealthViewModel: CustomizableUserHealthViewModel {
    
}

// MARK: - Interface for view
extension UserHealthViewModel: UserHealthViewModelProtocol {
    
    func authorizeHealthKit(completion: @escaping () -> Void) {
        healthKitManager.authorizeHealthKit { _, _ in
            completion()
        }
    }
    
    func loadUserHealthProfile(completion: @escaping (UserHealthProfile) -> Void) {
        healthKitManager.loadUserHealthProfile(completion: completion)
    }
}

