//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// LogInViewController - стартовый контроллер входа, в нем отображаются поля для ввода логина и пороля
final class LogInViewController: UIViewController {
    
    // константы
    private let birthdayRemibLabel = UILabel()
    private let sigInLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let faceIDLabel = UILabel()
    
    private let mailText = UITextField()
    private let passText = UITextField()
    
    private let mailView = UIView()
    private let passView = UIView()
    
    private let comeInButton = UIButton()
    private let eyeButton = UIButton()
    private let switc = UISwitch()
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        allViewCreateFunc()
    }
    
    private func allViewCreateFunc() {
        createBirthLabel()
        createSignInLabel()
        createMilLabel()
        createPassLabel()
        createFaceIdLabel()
        setswitch()
        createMailView()
        createMailField()
        createPassField()
        createComeButtAction()
        createEyeButtAction()
        
    }
    
    private func createBirthLabel() {
        birthdayRemibLabel.frame = CGRect(x: 80, y: 100, width: 220, height: 80)
        birthdayRemibLabel.layer.borderColor = UIColor.black.cgColor
        birthdayRemibLabel.layer.borderWidth = 2
        birthdayRemibLabel.text = "Birthday Reminder"
        birthdayRemibLabel.textAlignment = NSTextAlignment.center
        birthdayRemibLabel.textColor = UIColor.systemBlue
        birthdayRemibLabel.backgroundColor = UIColor.white
        view.addSubview(birthdayRemibLabel)
    }
    
    private func createSignInLabel() {
        sigInLabel.frame = CGRect(x: 45, y: 255, width: 90, height: 50)
        sigInLabel.text = "Sign In"
        sigInLabel.textColor = UIColor.black
        sigInLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        view.addSubview(sigInLabel)
        
    }
    
    private func createMilLabel() {
        emailLabel.frame = CGRect(x: 45, y: 320, width: 40, height: 20)
        emailLabel.text = "Email"
        emailLabel.textColor = UIColor.systemBlue
        emailLabel.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(emailLabel)
    }
    
    private func createPassLabel() {
        passwordLabel.frame = CGRect(x: 45, y: 420, width: 70, height: 20)
        passwordLabel.text = "Password"
        passwordLabel.textColor = UIColor.systemBlue
        passwordLabel.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(passwordLabel)
    }
    
    private func createFaceIdLabel() {
        faceIDLabel.frame = CGRect(x: 150, y: 520, width: 125, height: 30)
        faceIDLabel.text = "Вход по Face ID"
        faceIDLabel.textColor = UIColor.black
        faceIDLabel.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(faceIDLabel)
        
    }
    
    private func setswitch() {
        switc.frame = CGRect(x: 275, y: 520, width: 0, height: 0)
        switc.isOn = true
        view.addSubview(switc)
    }
    
    private func createMailField() {
        mailText.frame = CGRect(x: 45, y: 345, width: 300, height: 30)
        mailText.textColor = UIColor.black
        mailText.placeholder = "Введите электронную почту"
        view.addSubview(mailText)
    }
    private func createMailView() {
        mailView.frame = CGRect(x: 45, y: 385, width: 300, height: 1)
        mailView.backgroundColor = UIColor.lightGray
        view.addSubview(mailView)
    }
    
    private func createPassField() {
        passText.frame = CGRect(x: 45, y: 445, width: 300, height: 30)
        passText.textColor = UIColor.black
        passText.placeholder = "Введите пороль"
        passText.isSecureTextEntry = true
        view.addSubview(passText)
        
        passView.frame = CGRect(x: 45, y: 485, width: 300, height: 1)
        passView.backgroundColor = UIColor.lightGray
        view.addSubview(passView)
    }
    // MARK: - Экшны
    private func createComeButtAction() {
        comeInButton.frame = CGRect(x: 55, y: 610, width: 280, height: 50)
        comeInButton.backgroundColor = UIColor.systemBlue
        comeInButton.setTitle("Войти", for: .normal)
        comeInButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .heavy)
        comeInButton.tintColor = UIColor.white
        comeInButton.layer.cornerRadius = 5
        comeInButton.layer.masksToBounds = true
        comeInButton.addTarget(self, action: #selector(comeInButtAction), for: .touchUpInside)
        view.addSubview(comeInButton)
    }
    
    private func createEyeButtAction() {
        eyeButton.frame = CGRect(x: 315, y: 445, width: 30, height: 40)
        eyeButton.backgroundColor = .systemBackground
        eyeButton.setImage(UIImage.init(systemName: "eye.slash.fill"), for: .normal)
        eyeButton.tintColor = .systemGray
        eyeButton.addTarget(self, action: #selector(eyeAction), for: .touchUpInside)
        view.addSubview(eyeButton)
    }
    
    @objc private func comeInButtAction() {
        let birthdayController = BirthdaysViewController()
        navigationController?.pushViewController(birthdayController, animated: true)
    }
    
    @objc private func eyeAction() {
        if counter == 0 {
            passText.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            counter += 1
        } else {
            passText.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            counter = 0
        }
    }
}
