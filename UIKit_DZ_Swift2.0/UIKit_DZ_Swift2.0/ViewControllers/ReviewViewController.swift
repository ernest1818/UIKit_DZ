//
//  ReviewViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 30.09.2022.
//

import UIKit

// контроллер реализации обратной связи с клиентом *опициональное - обратная связь
class ReviewViewController: UIViewController {

    // MARK: - Privet properties
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = UIColor(named: "myColor")
        return button
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 40, width: 310, height: 50)
        label.font = .italicSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(named: "myColor")?.cgColor
        label.textColor = .black
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 95, width: 310, height: 50)
        label.font = .italicSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(named: "myColor")?.cgColor
        label.textColor = .black
        return label
    }()
    
    private lazy var therdLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 150, width: 310, height: 50)
        label.font = .italicSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(named: "myColor")?.cgColor
        label.textColor = .black
        return label
    }()
    
    private lazy var creviewsButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 50, y: 635, width: 290, height: 50)
        button.backgroundColor = UIColor(named: "myColor")
        button.setTitle("Оставь отзыв", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateViews()
    }
    
    // MARK: - Private Methods
    private func configurateViews() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(therdLabel)
        view.addSubview(creviewsButton)
        buttonAction()
    }
    
    // MARK: - Actions
    private func buttonAction() {
        creviewsButton.addTarget(self, action: #selector(alertTextAction), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(goBackAction), for: .touchUpInside)
    }
    
    @objc private func alertTextAction() {
        let alertController = UIAlertController(title: "Внимание!",
                                                message: "Отзыв не всегда отрицательный",
                                                preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "OK", style: .default) {_ in
            let text = alertController.textFields?.first?.text
            self.firstLabel.text = text
        }
        
        alertController.addAction(alertControllerAction)
        alertController.addTextField { $0.placeholder = "лучшая компания в регионе"}
        present(alertController, animated: true)
    }
    
    @objc private func goBackAction() {
        dismiss(animated: true)
    }

}
