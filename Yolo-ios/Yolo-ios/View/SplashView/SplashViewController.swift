//
//  SplashViewController.swift
//  Yolo-ios
//
//  Created by Cemre Öncel on 4.08.2022.
//

import UIKit

class SplashViewController: BaseViewController, SplashViewModelDelegate {
    
    
    // MARK: - Properties
    var viewModel: SplashViewModel!
    
    // MARK: - SplashViewModelDelegate Methods
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    override func contentDidLoad() {
        
    }
    
    override func contentWillLoad() {
        
    }
    
    func navigateToHomePage() {
//        let vc: HomeViewController = HomeViewController.create()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToLoginPage() {
        let vc: LoginViewController = LoginViewController.create()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showErrorMessageAndClose(errorMessage: String) {
        let actionRetry = UIAlertAction(title: "tryAgain".localized, style: .default) { [weak self] (action) in
            self?.viewModel.checkUserLoggedInAndNavigate()
        }
        
        self.showErrorAlert(message: errorMessage, customAction: actionRetry)
    }
}

// MARK: - Creator
extension SplashViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "SplashViewController"
        }
    }
    
    class func create() -> SplashViewController {
        let vc: SplashViewController = SplashViewController.instantiateFromNib()
        let viewModel: SplashViewModel = SplashViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        
        return vc
    }
}
