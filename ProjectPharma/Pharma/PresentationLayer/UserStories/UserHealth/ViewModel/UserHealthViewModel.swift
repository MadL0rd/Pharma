//
//  UserHealthViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class UserHealthViewModel {
	var output: UserHealthOutput?
}

// MARK: - Configuration
extension UserHealthViewModel: CustomizableUserHealthViewModel {

}

// MARK: - Interface for view
extension UserHealthViewModel: UserHealthViewModelProtocol {

}

