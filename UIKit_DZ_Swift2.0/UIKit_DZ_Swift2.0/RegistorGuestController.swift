//
//  RegistorGuestController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// RegistorGuestController
final class RegistorGuestController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var guestCountTextField: UITextField!
    @IBOutlet weak var numberTabTextField: UITextField!
    
    @IBOutlet weak var bookingSwitch: UISwitch!
    @IBOutlet weak var prepaymentSwitch: UISwitch!
    @IBOutlet weak var vipRoomSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "checkVC" else { return }
        guard let desination = segue.destination as? CheckViewController else { return }
        desination.name = nameTextField.text ?? ""
        desination.guestCount = guestCountTextField.text ?? ""
        desination.numberTab = numberTabTextField.text ?? ""
        
        if self.bookingSwitch.isOn {
            desination.booking = "50"
        }
        if self.prepaymentSwitch.isOn {
            desination.prepayment = "200"
        }
        if self.vipRoomSwitch.isOn {
            desination.vipRoom = "1000"
        }
        
    }

    @IBAction func checkButton(_ sender: Any) {
       checkAlert()
    }
    
    func checkAlert() {
        let alert  = UIAlertController(title: "Выставить чек?", message: "                   ", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Чек", style: .default) {_ in
            self.performSegue(withIdentifier: "checkVC", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
