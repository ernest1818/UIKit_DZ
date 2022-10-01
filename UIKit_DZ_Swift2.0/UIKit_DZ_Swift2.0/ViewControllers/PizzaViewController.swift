//
//  PizzaViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 28.09.2022.
//

import UIKit

/// контроллер выбора пиццы
final class PizzaViewController: UIViewController {
    
    // MARK: - Privet properties
    private let pizzaMargarita = Pizza(name: "Маргарита", imageName: "margo")
    private let pizzaPepperoni = Pizza(name: "Пеперони", imageName: "peperoni")
    private lazy var margaritaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 150, width: 100, height: 100)
        imageView.image = UIImage(named: pizzaMargarita.imageName ?? "")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var pepperoniImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 295, width: 100, height: 100)
        imageView.image = UIImage(named: pizzaPepperoni.imageName ?? "")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var margaritaLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 125, y: 170, width: 170, height: 60)
        label.text = pizzaMargarita.name
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var pepperoniLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 125, y: 320, width: 170, height: 60)
        label.text = pizzaPepperoni.name
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var margoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 330, y: 185, width: 30, height: 30)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var pepperoniButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 330, y: 335, width: 30, height: 30)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
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
        configurationView()
        configurateSelfController()
        pizzaButtonsAction()
    }
    
    private func configurationView() {
        view.backgroundColor = .white
        title = "Pizza"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backBarItemAction))
    }
    
    private func configurateSelfController() {
        
        view.addSubview(margaritaImageView)
        view.addSubview(pepperoniImageView)
        view.addSubview(margaritaLabel)
        view.addSubview(pepperoniLabel)
        view.addSubview(margoButton)
        view.addSubview(pepperoniButton)
    }
    
    // MARK: - Actions
    private func pizzaButtonsAction() {
        margoButton.addTarget(self, action: #selector(margoButtonAction), for: .touchUpInside)
        pepperoniButton.addTarget(self, action: #selector(margoButtonAction), for: .touchUpInside)
    }
    
    @objc private func backBarItemAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func margoButtonAction() {
        let ingredientVC = IngradiantsViewController()
        if margoButton.isTouchInside {
            ingredientVC.pizza = pizzaMargarita
        } else if pepperoniButton.isTouchInside {
            ingredientVC.pizza = pizzaPepperoni
        }
        present(ingredientVC, animated: true, completion: nil)
    }
}
