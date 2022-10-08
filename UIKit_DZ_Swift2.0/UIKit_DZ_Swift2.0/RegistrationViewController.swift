//
//  RegistartionViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// Экран регистрации  юзера в приложении
final class RegistrationViewController: UIViewController {

// MARK: @IBOutlets
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var nameTaxtField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
// MARK: - Private properties
    private let defaults = UserDefaults.standard
    
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
        registrationView.layer.cornerRadius = 100
        registrationView.layer.shadowColor = UIColor.black.cgColor
        registrationView.layer.shadowOffset = CGSize(width: 0, height: 0)
        registrationView.layer.shadowRadius = 4.0
        registrationView.layer.shadowOpacity = 0.6
    }
    // MARK: - IBActions
    @IBAction func registrationAction(_ sender: Any) {
        guard let name = nameTaxtField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let surName = surnameTextField.text else { return }
        guard let userName = userNameTextField.text else { return }
//
        defaults.set(name, forKey: "name")
        defaults.set(password, forKey: "pass")
        defaults.set(surName, forKey: "surName")
        defaults.set(userName, forKey: "userName")
       
        
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
