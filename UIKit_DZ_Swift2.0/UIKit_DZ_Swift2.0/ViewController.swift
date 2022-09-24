//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// ViewController
class ViewController: UIViewController {
    
    let leftButton = UIButton()
    let rightButton = UIButton()
    let userNameLabel = UILabel()
    let sumLabel = UILabel()
    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createUserNameLabel()
        createLeftButton()
        createRightButton()
        createSumLabel()
        createResultLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userNameAlert()
    }
    
    func createLeftButton() {
        leftButton.frame = CGRect(x: 10, y: 600, width: 120, height: 40)
        leftButton.backgroundColor = .green
        leftButton.setTitle("Сложение", for: .normal)
        leftButton.addTarget(self, action: #selector(alert), for: .touchUpInside)
        view.addSubview(leftButton)
    }
    
    @objc func alert() {
        let alertController = UIAlertController.init(title: nil,
                                                     message: "Введите необходимые целые числа",
                                                     preferredStyle: .alert)
        let action = UIAlertAction(title: "посчитать", style: .default) { _ in
            guard var textOne = Int(alertController.textFields?.first?.text ?? "введите число") else { return }
            guard let textTwo = Int(alertController.textFields?.last?.text ?? "введите число") else { return }
            var sum = textOne + textTwo
            self.sumLabel.text = String(sum)
            }
            
            alertController.addTextField { $0.placeholder = "Число первое" }
            alertController.addTextField { $0.placeholder = "Число второе" }
            alertController.addAction(action)
            
            self.present(alertController, animated: true)
        }
    
    func createRightButton() {
        rightButton.frame = CGRect(x: 250, y: 600, width: 120, height: 40)
        rightButton.backgroundColor = .red
        rightButton.setTitle("Угадай число", for: .normal)
        rightButton.addTarget(self, action: #selector(alertRightButton), for: .touchUpInside)
        view.addSubview(rightButton)
    }
    
    @objc func alertRightButton() {
        let alertController = UIAlertController.init(title: "Поиграем в игру",
                                                     message: "Угадайте число которое я загадал от 1 до 10",
                                                     preferredStyle: .alert)
        let action = UIAlertAction.init(title: "ok", style: .default) { _ in
            let number = "6"
            guard let textField = alertController.textFields?.first?.text else { return }
            
            if textField == "6" {
                self.resultLabel.text = "вы угадали число - это число \(number)"
            } else {
                self.resultLabel.text = "не верно, пробуйте еще"
            }
        }
        
        alertController.addTextField { $0.placeholder = "Введите число" }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func createUserNameLabel() {
        userNameLabel.frame = CGRect(x: 75, y: 100, width: 250, height: 60)
        userNameLabel.backgroundColor = .systemMint
        userNameLabel.textAlignment = .center
        view.addSubview(userNameLabel)
    }
    
    func createSumLabel() {
        sumLabel.frame = CGRect(x: 75, y: 300, width: 250, height: 60)
        sumLabel.backgroundColor = .green
        sumLabel.textAlignment = .center
        view.addSubview(sumLabel)
    }
    
    func createResultLabel() {
        resultLabel.frame = CGRect(x: 75, y: 200, width: 250, height: 60)
        resultLabel.backgroundColor = .red
        resultLabel.textAlignment = .center
        view.addSubview(resultLabel)
    }
    
    func userNameAlert() {
        let alertController = UIAlertController.init(title: "Внимание",
                                                     message: "Введите ваше имя",
                                                     preferredStyle: .alert)
        let action = UIAlertAction.init(title: "ok", style: .default) { _ in
            let text = alertController.textFields?.first
            self.userNameLabel.text = text?.text
        }
        alertController.addTextField { $0.placeholder = "Введите имя" }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
