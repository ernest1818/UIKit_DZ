//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// LoginViewController - контроллер входа в приложение, где неоходимо заполнить логин и пароль
final class LoginViewController: UIViewController {

    // MARK: - Privet properties
    private lazy var loginImageView = UIImageView()
    private lazy var emailLabel = UILabel()
    private lazy var passwordLabel = UILabel()
    private lazy var emailTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var enterButton = UIButton()
    private lazy var emailLineView = UIView()
    private lazy var passwordLineView = UIView()
    
    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurateViews()
    }
    
    // MARK: - Private Methods
    private func configurateViews() {
        createImageView()
        createLabels()
        createTextFields()
        createLineViews()
        createEnterButtonAction()
    }
    
    private func createImageView() {
        loginImageView.frame = CGRect(x: 135, y: 100, width: 120, height: 120)
        loginImageView.image = UIImage(named: "loginImage")
        loginImageView.layer.cornerRadius = 10
        loginImageView.layer.masksToBounds = true
        loginImageView.contentMode = .scaleAspectFit
        view.addSubview(loginImageView)
    }
    
    private func createLabels() {
        emailLabel.frame = CGRect(x: 40, y: 290, width: 100, height: 30)
        emailLabel.text = "Email"
        emailLabel.textColor = UIColor(named: "myColor")
        emailLabel.font = .systemFont(ofSize: 15, weight: .bold)
        view.addSubview(emailLabel)
        
        passwordLabel.frame = CGRect(x: 40, y: 370, width: 100, height: 30)
        passwordLabel.text = "Password"
        passwordLabel.textColor = UIColor(named: "myColor")
        passwordLabel.font = .systemFont(ofSize: 15, weight: .bold)
        view.addSubview(passwordLabel)
    }
    
    private func createTextFields() {
        emailTextField.frame = CGRect(x: 40, y: 320, width: 310, height: 40)
        emailTextField.placeholder = "+70000000000"
        emailTextField.keyboardType = .numberPad
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: 40, y: 400, width: 310, height: 40)
        passwordTextField.placeholder = "password"
        view.addSubview(passwordTextField)
    }
    
    private func createLineViews() {
        emailLineView.frame = CGRect(x: 40, y: 360, width: 310, height: 1)
        emailLineView.backgroundColor = .systemGray6
        view.addSubview(emailLineView)
        
        passwordLineView.frame = CGRect(x: 40, y: 440, width: 310, height: 1)
        passwordLineView.backgroundColor = .systemGray6
        view.addSubview(passwordLineView)
    }
    // MARK: - Actions
    private func createEnterButtonAction() {
        enterButton.frame = CGRect(x: 40, y: 600, width: 310, height: 45)
        enterButton.backgroundColor = UIColor(named: "myColor")
        enterButton.layer.cornerRadius = 10
        enterButton.layer.masksToBounds = true
        enterButton.setTitle("Войти", for: .normal)
        enterButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.addTarget(self, action: #selector(showFoodVCAction), for: .touchUpInside)
        view.addSubview(enterButton)
    }
    
    @objc private func showFoodVCAction() {
        let foodVC = FoodViewController()
        let navigationController = UINavigationController(rootViewController: foodVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
