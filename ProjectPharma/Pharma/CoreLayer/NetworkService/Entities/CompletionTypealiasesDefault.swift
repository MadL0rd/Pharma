//
//  CompletionTypealiasesDefault.swift
//  ClubhouseAvatarMaker
//
//  Created by Anton Tekutov on 19.06.21.
//

import Alamofire

typealias DefaultRequestCompletion<T: Codable> = (Result<T, NetworkServiceError>) -> Void
