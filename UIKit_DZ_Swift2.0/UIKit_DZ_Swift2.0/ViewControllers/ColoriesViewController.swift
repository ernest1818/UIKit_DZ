//
//  ColoriesViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 29.09.2022.
//

import UIKit

/// контроллер описывающий состав пиццы и колорийность *опициональное - колории и состав
final class ColoriesViewController: UIViewController {
    
    // MARK: - Public properties
    var pizza: Pizza?
    var ingrediant = PizzaIngredient()
    
    // MARK: - Privet properties
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .orange
        return button
    }()
    
    private lazy var pizzaLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 60, width: 310, height: 60)
        label.backgroundColor = .orange
        label.textColor = .white
        label.text = pizza?.name
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var compoundLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 130, width: 300, height: 30)
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "Состав и колорийность:"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.layer.cornerRadius = 10
        label.textAlignment = .left
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var ingrediantLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 160, width: 350, height: 200)
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.layer.cornerRadius = 10
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateView()
    }
    
    // MARK: - Private Methods
    private func configurateView() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(pizzaLabel)
        view.addSubview(ingrediantLabel)
        view.addSubview(compoundLabel)
        buttonActions()
        setLabelText()
    }
    
    private func setLabelText() {
        if pizzaLabel.text == "Маргарита" {
            ingrediantLabel.text = """
- \(ingrediant.dough)
- \(ingrediant.mozzarella)
- \(ingrediant.tomatoSauce)
- \(ingrediant.blackPepper)
- общая коллорийность составляет 208 кКал
"""
        } else {
            ingrediantLabel.text = """
- \(ingrediant.dough)
- \(ingrediant.mozzarella)
- \(ingrediant.tomatoSauce)
- \(ingrediant.oregano)
- \(ingrediant.ownJuice)
- \(ingrediant.sausage)
- \(ingrediant.blackPepper)
- общая коллорийность составляет 230 кКал
"""
        }
    }
    
    // MARK: - Actions
    private func buttonActions() {
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }
    
    @objc private func backButtonAction() {
        dismiss(animated: true)
    }
}
