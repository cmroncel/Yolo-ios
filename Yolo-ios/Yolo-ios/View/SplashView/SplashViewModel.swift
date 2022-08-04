//
//  SplashViewModel.swift
//  Yolo-ios
//
//  Created by Cemre Öncel on 4.08.2022.
//

import Foundation

protocol SplashViewModelDelegate: BaseViewModelDelegate {
    func showErrorMessageAndClose(errorMessage: String)
    func navigateToHomePage()
    func navigateToLoginPage()
}

class SplashViewModel: BaseViewModel {
    
//    private let userRepository: UserRepository
//    private let applicationRepository: ApplicationRepository
    
    weak var delegate: SplashViewModelDelegate?
//    var user: User?
    
//    init(userRepository: UserRepository = RepositoryProvider.userRepository,
//         applicationRepository: ApplicationRepository = RepositoryProvider.applicationStatusRepository) {
//        self.userRepository = userRepository
//        self.applicationRepository = applicationRepository
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkUserLoggedInAndNavigate()
    }
    
    override func appDidBecomeActive(_ sender: Any?) {
        
    }
    
    func checkUserLoggedInAndNavigate() {
        delegate?.navigateToLoginPage()
    }
}
