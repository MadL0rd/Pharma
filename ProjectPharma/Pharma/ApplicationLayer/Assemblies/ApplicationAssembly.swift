//
//  ApplicationAssembly.swift
//  Pharma
//
//  Created by Anton Tekutov on 19.06.21.
//

import Foundation

class ApplicationAssembly {
    
    static var appRouter: AppRouter = {
        return MainAppRouter()
    }()
}
