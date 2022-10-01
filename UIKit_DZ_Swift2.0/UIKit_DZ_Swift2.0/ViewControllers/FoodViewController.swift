//
//  FoodViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 28.09.2022.
//

import UIKit

/// FoodViewController - класс  отображения меню
final class FoodViewController: UIViewController {
    
    // MARK: - Privet properties
    private lazy var pizzaButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 130, width: 330, height: 100)
        button.setTitle("Pizza", for: .normal)
        button.setTitleColor(UIColor(named: "myColor"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private lazy var sushiButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 250, width: 330, height: 100)
        button.setTitle("Sushi", for: .normal)
        button.setTitleColor(UIColor(named: "myColor"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private lazy var reviewButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 600, width: 330, height: 50)
        button.setTitle("Оставте отзыв о нашей компании", for: .normal)
        button.setTitleColor(UIColor(named: "myColor"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()

    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateViews()
    }
    
    // MARK: - Private Methods
    private func configurateViews() {
        configurateSelfController()
        buttonActions()
    }
    
    private func configurateSelfController() {
        view.backgroundColor = .white
        title = "Food"
        view.addSubview(pizzaButton)
        view.addSubview(sushiButton)
        view.addSubview(reviewButton)
    }
    
    // MARK: - Actions
    private func buttonActions() {
        pizzaButton.addTarget(self, action: #selector(showPizzaVCAction), for: .touchUpInside)
        reviewButton.addTarget(self, action: #selector(showReviewAction), for: .touchUpInside)
    }
    
    @objc private func showPizzaVCAction() {
        let pizzaVC = PizzaViewController()
        navigationController?.pushViewController(pizzaVC, animated: true)
    }
    
    @objc private func showReviewAction() {
        let reviewVC = ReviewViewController()
        present(reviewVC, animated: true)
    }
}
