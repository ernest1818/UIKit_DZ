//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// ViewController
class ViewController: UIViewController {
    
    @IBOutlet weak var piker: UIPickerView!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sharedButtonAction(_ sender: Any) {
        
        let customItem = SharedFaceBook(title: "facebook", image: UIImage(named: "a")) { sharedItems in
            guard let sharedStrings = sharedItems as? [String] else { return }

            for string in sharedStrings {
                print("Here's the string: \(string)")
            }
        }
        guard let link = NSURL(string: "https://www.facebook.com") else { return }
        
        let activityController = UIActivityViewController(activityItems: [link], applicationActivities: [customItem])
        activityController.excludedActivityTypes = [.mail, .airDrop]
        present(activityController, animated: true)
                
    }
}
// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "Угадай где sharing \(row)"
    }
    
}
// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            let activituController = UIActivityViewController(
                activityItems: ["Good morning mr. President"],
                applicationActivities: nil
            )
            present(activituController, animated: true)
            piker.resignFirstResponder()
        }
    }
}
