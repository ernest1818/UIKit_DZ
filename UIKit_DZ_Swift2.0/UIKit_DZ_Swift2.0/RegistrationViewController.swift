//
//  RegistartionViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// контроллер регистрации  юзера в приложении
class RegistrationViewController: UIViewController {

// MARK: @IBOutlets
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var nameTaxtField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
// MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { _ in
            self.view.frame.origin.y = -100.0
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification,
                                               object: nil,
                                               queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
        
        setupUI()
    }
    
// MARK: - Private Methods
    private func setupUI() {
        setUpRegistrationView()
    }
    
    private func setUpRegistrationView() {
        registrationView.layer.cornerRadius = 100
        registrationView.layer.shadowColor = UIColor.black.cgColor
        registrationView.layer.shadowOffset = CGSize(width: 0, height: 0)
        registrationView.layer.shadowRadius = 4.0
        registrationView.layer.shadowOpacity = 0.6
    }
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touchesSet: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTaxtField:
            surnameTextField.becomeFirstResponder()
        case surnameTextField:
            userNameTextField.becomeFirstResponder()
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
