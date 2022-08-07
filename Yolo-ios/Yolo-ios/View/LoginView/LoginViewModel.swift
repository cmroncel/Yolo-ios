//
//  LoginViewModel.swift
//  Yolo-ios
//
//  Created by Cemre Öncel on 7.08.2022.
//

import Foundation

protocol LoginViewModelDelegate: BaseViewModelDelegate {
    
}

class LoginViewModel: BaseViewModel {
    weak var delegate: LoginViewModelDelegate?
    
    var isToolTipShow: Bool = false
}
