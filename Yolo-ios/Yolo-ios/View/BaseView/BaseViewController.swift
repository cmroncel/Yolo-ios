//
//  BaseViewController.swift
//  Yolo-ios
//
//  Created by Cemre Öncel on 4.08.2022.
//

import Foundation
import UIKit
import JGProgressHUD

class BaseViewController: UIViewController, BaseViewModelDelegate {
    // MARK:- Properties
    private var viewModel: BaseViewModel!
    private var progressViewCount: Int = 0
    
    // MARK:- Views
    private let progressHUD = JGProgressHUD(style: .light)
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let baseVM = provideViewModel() else {
            fatalError("A view model must be provided")
        }
        
        viewModel = baseVM
        viewModel.baseVMDelegate = self
        
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
    // MARK:- BaseViewModel Provider
    func provideViewModel() -> BaseViewModel? {
        return nil
    }
    
    // MARK:- BaseViewModelDelegate
    func readyForContent() {
        
    }
    
    func contentDidLoad() {
        progressViewCount -= 1

        guard progressViewCount == 0 else {
            return
        }
        
        progressHUD.dismiss()
    }
    
    func contentWillLoad() {
        progressViewCount += 1

        guard progressViewCount == 1 else {
            return
        }

        progressHUD.show(in: self.view)
    }
    
    func applicationMustBeUpdated() {
//        let actionUpdate = UIAlertAction(title: "updateApp".localized, style: .default, handler: { (action) in
//            if let url = URL(string: "itms-apps://itunes.apple.com/app/id1532715452") {
//                if UIApplication.shared.canOpenURL(url) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
//                        exit(0)
//                    })
//                }
//                else {
//                    exit(0)
//                }
//            }
//            else {
//                exit(0)
//            }
//        })
//
//        let actionClose = UIAlertAction(title: "maybeLater".localized, style: .cancel, handler: { (action) in
//            exit(0)
//        })
//
//        self.showAlert(title: "errorDialogTitle".localized, message: "updateRequiredMessage".localized, actions: [actionClose, actionUpdate])
    }
    
    func applicationClosed(message: String) {
//        let action = UIAlertAction(title: "done".localized, style: .default) { (action) in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                exit(0)
//            }
//        }
//
//        self.showErrorAlert(message: message, customAction: action)
    }
    
    func userMustReLogin() {
//        let action = UIAlertAction(title: "done".localized, style: .default) {[weak self] (action) in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                AppDelegate.shared.rootNavController?.popToRootViewController(animated: true)
//            }
//        }
//
//        self.showErrorAlert(message: "userReLoginMessage".localized, customAction: action)
    }
    
    func appTokenNotAvailable() {
//        let action = UIAlertAction(title: "tryAgain".localized, style: .default) {[weak self] (_) in
//            self?.viewModel.refreshAppToken()
//        }
//
//        self.showErrorAlert(message: "userReLoginMessage".localized, customAction: action)
    }
    
    func showUserBannedMessage(message: String) {
//        let action = UIAlertAction(title: "done".localized, style: .default) {[weak self] (action) in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                AppDelegate.shared.rootNavController?.popToRootViewController(animated: true)
//            }
//        }
//
//        self.showAlert(title: "accountBanned".localized, message: message, actions: [action])
    }
    
    func applicationStatusFetchFailed(message: String) {
//
//        let action = UIAlertAction(title: "done".localized, style: .default) { (action) in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                exit(0)
//            }
//        }
//
//        self.showErrorAlert(message: message, customAction: action)
    }
    
//    func navigateToDeeplink(deeplinkNavigation: DeeplinkNavigation) {
//        for item in deeplinkNavigation.items {
//            if item.presentationStyle == .navigationControllerPush {
//                AppDelegate.shared.rootNavController?.pushViewController(item.viewController, animated: false)
//            }
//            else if item.presentationStyle == .viewControllerPresentation {
//                AppDelegate.shared.rootNavController?.present(item.viewController, animated: true, completion: nil)
//            }
//        }
//
//        if let c = deeplinkNavigation.completion {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                c()
//            }
//        }
//    }
}

