//
//  ShopSearchViewModel.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

final class ShopSearchViewModel {
	var output: ShopSearchOutput?
}

// MARK: - Configuration
extension ShopSearchViewModel: CustomizableShopSearchViewModel {

}

// MARK: - Interface for view
extension ShopSearchViewModel: ShopSearchViewModelProtocol {

}

