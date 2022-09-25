//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// LoginViewController
final class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eyeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if mailTextField.text == "0" && passwordTextField.text == "0" {
            performSegue(withIdentifier: "guestVC", sender: nil)
        } else {
            wrongPassAlert()
        }
    }
    
    func wrongPassAlert() {
        let alert = UIAlertController(title: "Внимание",
                                      message: "Неверный login или password, попробуйте снова",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
