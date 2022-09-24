//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// ViewController
class ViewController: UIViewController {

    let resultLabel = UILabel()
    let begunButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        createBegunButton()
    }
    
    func createLabel() {
        resultLabel.frame = CGRect(x: 48, y: 100, width: 300, height: 60)
        resultLabel.textAlignment = .center
        resultLabel.backgroundColor = .black
        resultLabel.textColor = .white
        view.addSubview(resultLabel)
    }
    
    func createBegunButton() {
        begunButton.frame = CGRect(x: 48, y: 600, width: 300, height: 60)
        begunButton.addTarget(self, action: #selector(begunButtonAlert), for: .touchUpInside)
        begunButton.setTitle("Начать", for: .normal)
        begunButton.backgroundColor = .red
        view.addSubview(begunButton)
    }
    
    @objc func begunButtonAlert() {
        let alert = UIAlertController(title: nil, message: "введите слово", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok", style: .default) { _ in
            guard var text = alert.textFields?.first?.text else { return }
            if text == "leohl" {
                self.resultLabel.text = WordModel.myWord(word: &text)
            } else {
                self.resultLabel.text = text
            }
        }
        alert.addTextField { $0.placeholder = "введите слово" }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
