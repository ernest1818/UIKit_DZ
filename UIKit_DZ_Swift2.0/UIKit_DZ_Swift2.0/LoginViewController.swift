//
//  LoginViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 05.10.2022.
//

import UIKit

///  контроллер входа в приложение
class LoginViewController: UIViewController {
    
// MARK: - IBOutlets
    @IBOutlet weak var loginTextView: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
// MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
// MARK: - IBActions
    @IBAction func enterButton(_ sender: Any) {
        if loginTextView.text == defaults.object(forKey: "userName") as? String &&
            passwordTextField.text == defaults.object(forKey: "pass") as? String {
            performSegue(withIdentifier: "showTabBar", sender: nil)
        } else {
        
        }
    }
    
}
