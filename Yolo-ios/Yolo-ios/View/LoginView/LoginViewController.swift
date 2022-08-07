//
//  LoginViewController.swift
//  Yolo-ios
//
//  Created by Cemre Öncel on 7.08.2022.
//

import UIKit
import M13Checkbox

class LoginViewController: BaseViewController {
    // MARK: -Views
    @IBOutlet weak var phoneNumberTextField: BaseTextField!
    @IBOutlet weak var countryCodeView: BaseView!
    @IBOutlet weak var passwordTextField: BaseTextField!
    @IBOutlet weak var loginButton: BaseButton!
    @IBOutlet weak var rememberMeCheckBox: M13Checkbox!
    @IBOutlet weak var showHidePasswordButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registerButton: BaseButton!
    @IBOutlet weak var guestButton: BaseButton!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var rememberMeLabel: UILabel!
    @IBOutlet weak var passwordPolicyLabel: UILabel!
    
    // MARK: -Properties
    var viewModel: LoginViewModel!
    
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    // MARK: -UI Methods
    private func initUI() {
        setUpTexts()
        
        phoneNumberTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.isUserInteractionEnabled = false
    }
    
    private func setUpTexts() {
        phoneNumberLabel.text = "phoneNumberText".localized
        passwordLabel.text = "passwordText".localized
        passwordPolicyLabel.text = "passwordPolicyText".localized
        loginButton.setTitle("loginButtonText".localized, for: .normal)
        rememberMeLabel.text = "rememberMeText".localized
        forgotPasswordButton.setTitle("forgotPasswordText".localized, for: .normal)
        registerLabel.text = "registerText".localized
        registerButton.setTitle("registerButtonText".localized, for: .normal)
        guestButton.setTitle("guestButtonText".localized, for: .normal)
    }
    
    @IBAction func showHidePasswordButtonTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("Login button tapped")
    }
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        print("Forgot password button tapped")
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        print("Register button tapped")
    }
    
    @IBAction func guestButtonTapped(_ sender: UIButton) {
        print("Continue as guest button tapped")
    }
    
    private func validate() -> Bool {
        if phoneNumberTextField.text?.count != 10 {
            return false
        }
        
        if !(passwordTextField.text?.comfortsPasswordPolicy ?? false) {
            return false
        }
        
        return true
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.loginButton.backgroundColor = validate() ? .black : .lightGray
        self.loginButton.isUserInteractionEnabled = validate() ? true : false
    }
}

// MARK: -LoginViewModelDelegate Methods
extension LoginViewController: LoginViewModelDelegate {
    
}

// MARK: - Creator
extension LoginViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "LoginViewController"
        }
    }
    
    class func create() -> LoginViewController {
        let vc: LoginViewController = LoginViewController.instantiateFromNib()
        let viewModel: LoginViewModel = LoginViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        
        return vc
    }
}
