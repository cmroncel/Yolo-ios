//
//  BaseViewModel.swift
//  Yolo-ios
//
//  Created by Cemre Öncel on 4.08.2022.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func contentWillLoad()
    func contentDidLoad()
    func applicationClosed(message: String)
    func applicationMustBeUpdated()
    func readyForContent()
    func userMustReLogin()
    func appTokenNotAvailable()
    func showUserBannedMessage(message: String)
    func applicationStatusFetchFailed(message: String)
//    func navigateToDeeplink(deeplinkNavigation: DeeplinkNavigation)
}

class BaseViewModel: NSObject {
    // MARK:- Properties
    weak var baseVMDelegate: BaseViewModelDelegate?
//    private let applicationStatusRepository: ApplicationRepository
//    private let userRepository: UserRepository
    
//    init(applicationStatusRepository: ApplicationRepository = RepositoryProvider.applicationStatusRepository,
//         userRepository: UserRepository = RepositoryProvider.userRepository) {
//        self.applicationStatusRepository = applicationStatusRepository
//        self.userRepository = userRepository
//    }
    
    func viewDidLoad(){}
    
    func viewWillAppear(){
        NotificationCenter.default.addObserver(self, selector: #selector(userMustReLogin(_:)), name: .userMustReLogin, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive(_:)), name: .appDidBecomeActive, object: nil)
    }
    
    func viewDidAppear() {
        checkForApplicationStatus()
    }
    
    func viewWillDisappear(){
        NotificationCenter.default.removeObserver(self)
    }
    
    func viewDidDisappear(){}
    
//    @objc func appTokenNotAvailable(_ sender: Any?) {
//        self.baseVMDelegate?.appTokenNotAvailable()
//    }
    
    @objc func userMustReLogin(_ sender: Any?) {
        self.baseVMDelegate?.userMustReLogin()
    }
    
    @objc func appDidBecomeActive(_ sender: Any?) {
        checkForApplicationStatus()
    }
    
//    @objc func handleDeeplink(_ sender: Any){
//        checkForDeeplink()
//    }
    
    func refreshAppToken() {
//        RepositoryProvider.tokenRepository.getAppToken(completion: {[weak self] in
//            self?.baseVMDelegate?.contentWillLoad()
//        }) {[weak self] (errorDTO) in
//            self?.appTokenNotAvailable(nil)
//        }
    }
    
    func checkForApplicationStatus() {
        
    }
}

