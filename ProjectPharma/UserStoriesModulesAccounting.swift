//
// Auto generated file
//

import UIKit

protocol ModuleGenerator {
    func createModule() -> UIViewController
}

enum UserStoriesModulesDefault: ModuleGenerator {

    case barcodeMedsScaner
    case settings
    case aboutUs
    case loading
    case shopSearch
    case userHealth
    case aidKitTracker
    case mainMenu
    case supplementEditor

    func createModule() -> UIViewController {
        switch self {
        case .barcodeMedsScaner: 
            return BarcodeMedsScanerCoordinator.createModule()
        case .settings: 
            return SettingsCoordinator.createModule()
        case .aboutUs: 
            return AboutUsCoordinator.createModule()
        case .loading: 
            return LoadingCoordinator.createModule()
        case .shopSearch: 
            return ShopSearchCoordinator.createModule()
        case .userHealth: 
            return UserHealthCoordinator.createModule()
        case .aidKitTracker: 
            return AidKitTrackerCoordinator.createModule()
        case .mainMenu: 
            return MainMenuCoordinator.createModule()
        case .supplementEditor: 
            return SupplementEditorCoordinator.createModule()
        }
    }
}

enum UserStoriesModulesWithOutput: ModuleGenerator {

    case barcodeMedsScaner(output: BarcodeMedsScanerOutput)
    case settings(output: SettingsOutput)
    case aboutUs(output: AboutUsOutput)
    case loading(output: LoadingOutput)
    case shopSearch(output: ShopSearchOutput)
    case userHealth(output: UserHealthOutput)
    case aidKitTracker(output: AidKitTrackerOutput)
    case mainMenu(output: MainMenuOutput)
    case supplementEditor(output: SupplementEditorOutput)

    func createModule() -> UIViewController {
        switch self {
        case .barcodeMedsScaner(let output): 
            return BarcodeMedsScanerCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .settings(let output): 
            return SettingsCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .aboutUs(let output): 
            return AboutUsCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .loading(let output): 
            return LoadingCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .shopSearch(let output): 
            return ShopSearchCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .userHealth(let output): 
            return UserHealthCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .aidKitTracker(let output): 
            return AidKitTrackerCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .mainMenu(let output): 
            return MainMenuCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .supplementEditor(let output): 
            return SupplementEditorCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        }
    }
}
