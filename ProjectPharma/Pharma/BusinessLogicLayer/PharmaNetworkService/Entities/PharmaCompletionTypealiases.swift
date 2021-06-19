//  PharmaCompletionTypealiases.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import Alamofire

 typealias GetSupplementsCompletion = (Result<SupplementsSearchResult, NetworkServiceError>) -> Void
