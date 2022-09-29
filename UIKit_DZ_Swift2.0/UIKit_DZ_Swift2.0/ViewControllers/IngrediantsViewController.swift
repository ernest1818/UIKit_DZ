//
//  MenuPizzaViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 28.09.2022.
//

import UIKit

/// PopToFoodViewControllerDelegate
protocol PopToFoodViewControllerDelegate: AnyObject {
    func goToBack()
}

/// Контроллер отображающий дополнительные игредиенты для пиццы
final class IngradiantsViewController: UIViewController {
    
    // MARK: - Public properties
    public var pizza: Pizza?
    public lazy var goToBackClouser = {
        if let ingredientVC = self.presentingViewController as? UINavigationController {
            self.view.isHidden = true
            self.dismiss(animated: false)
            ingredientVC.popToRootViewController(animated: false)
        }
    }
    // MARK: - Privet properties
    private lazy var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 40, width: 290, height: 60)
        label.text = pizza?.name
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 40, y: 120, width: 320, height: 320)
        imageView.backgroundColor = .orange
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: pizza?.imageName ?? "")
        return imageView
    }()
    
    private lazy var cheeseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 460, width: 100, height: 30)
        label.text = "Сыр"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var humsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 500, width: 100, height: 30)
        label.text = "Ветчина"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var mashroomsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 540, width: 100, height: 30)
        label.text = "Грибы"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var olivesLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 580, width: 100, height: 30)
        label.text = "Маслины"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var cheeseSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 310, y: 460, width: 0, height: 0)
        return uiSwitch
    }()
    
    private lazy var humSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 310, y: 500, width: 0, height: 0)
        return uiSwitch
    }()
    
    private lazy var mashroomsSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 310, y: 540, width: 0, height: 0)
        return uiSwitch
    }()
    
    private lazy var olivesSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 310, y: 580, width: 0, height: 0)
        return uiSwitch
    }()
    
    private lazy var coloriesButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 50, y: 635, width: 290, height: 50)
        button.backgroundColor = .orange
        button.setTitle("Коллорийность", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var selectedButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 50, y: 700, width: 290, height: 50)
        button.backgroundColor = .orange
        button.setTitle("Выбрать", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateView()
    }
    
    // MARK: - Private Methods
    private func configurateView() {
        createLabels()
        createSwitches()
        buttonAction()
        view.backgroundColor = .white
        view.addSubview(pizzaNameLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(selectedButton)
        view.addSubview(coloriesButton)
    }
    
    private func createLabels() {
        view.addSubview(cheeseLabel)
        view.addSubview(humsLabel)
        view.addSubview(mashroomsLabel)
        view.addSubview(olivesLabel)
    }
    
    private func createSwitches() {
        view.addSubview(cheeseSwitch)
        view.addSubview(humSwitch)
        view.addSubview(mashroomsSwitch)
        view.addSubview(olivesSwitch)
    }
    
    // MARK: - Actions
    private func buttonAction() {
        selectedButton.addTarget(self, action: #selector(selectButtonAction), for: .touchUpInside)
        coloriesButton.addTarget(self, action: #selector(coloriesButtonAction), for: .touchUpInside)
    }
    
    @objc private func coloriesButtonAction() {
        let coloriesVC = ColoriesViewController()
        coloriesVC.pizza = pizza
        present(coloriesVC, animated: true)
    }
    
    @objc private func selectButtonAction() {
        let checkVC = CheckViewController()
        checkVC.delegate = self
        checkVC.goToBackClouser = goToBackClouser
        let navigatinoChecVC = UINavigationController(rootViewController: checkVC)
        checkVC.pizza = pizza
        if cheeseSwitch.isOn {
            checkVC.ingrediants.append("Cыр мацарела")
        } else {
            checkVC.ingrediants.append(nil)
        }
        
        if humSwitch.isOn {
            checkVC.ingrediants.append("Ветчина")
        } else {
            checkVC.ingrediants.append(nil)
        }
        
        if mashroomsSwitch.isOn {
            checkVC.ingrediants.append("Грибы")
        } else {
            checkVC.ingrediants.append(nil)
        }
        
        if olivesSwitch.isOn {
            checkVC.ingrediants.append("Маслины")
        } else {
            checkVC.ingrediants.append(nil)
        }
        
        navigatinoChecVC.modalPresentationStyle = .fullScreen
        present(navigatinoChecVC, animated: true)
    }
}

extension IngradiantsViewController: PopToFoodViewControllerDelegate {
    func goToBack() {
        if let ingredientVC = self.presentingViewController as? UINavigationController {
            view.isHidden = true
            dismiss(animated: false)
            ingredientVC.popToRootViewController(animated: false)
        }
    }
}
