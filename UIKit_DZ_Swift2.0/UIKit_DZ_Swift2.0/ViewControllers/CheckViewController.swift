//
//  CheckViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 28.09.2022.
//

import UIKit

/// контроллер отображающий итоговый заказ и способы оплаты данного заказа
final class CheckViewController: UIViewController {

    // MARK: - Public properties
    var pizza: Pizza?
    var ingrediants: [String?] = []
    var goToBackHandler: (() -> ())?
    weak var delegate: PopToFoodViewControllerDelegate?

    // MARK: - Privet properties
    private lazy var massege = """
Ваш заказ доставят в течении 15 минут.
Приятного аппетита!
"""
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 100, width: 150, height: 50)
        label.text = "Ваш заказ:"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 130, width: 200, height: 70)
        label.text = "пицца " + (pizza?.name ?? "")
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
     private lazy var oneIngredientLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 160, width: 200, height: 70)
//         label.text = ingrediants?[0] ?? ""
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var twoIngredientLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 190, width: 200, height: 70)
//        label.text = ingrediants?[1] ?? ""
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var threeIngredientLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 220, width: 200, height: 70)
//        label.text = ingrediants?[2] ?? ""
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var fourIngredientLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 250, width: 200, height: 70)
//        label.text = ingrediants?[3] ?? ""
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var cardLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 120, y: 500, width: 150, height: 40)
        label.text = "Оплата картой"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var cashLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 120, y: 550, width: 150, height: 40)
        label.text = "Наличными"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var cardSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 310, y: 500, width: 0, height: 0)
        uiSwitch.isOn = true
        return uiSwitch
    }()
    
    private lazy var cashSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 310, y: 550, width: 0, height: 0)
        uiSwitch.isOn = false
        return uiSwitch
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 700, width: 310, height: 60)
        button.setTitle("Pay", for: .normal)
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        return  button
    }()
    
    // MARK: - LifeCicles
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateView()
    }
    
    // MARK: - Private Methods
    private func configurateView() {
        title = "Оплата"
        view.backgroundColor = .white
        switchAction()
        buttonAction()
        createLabelTexts()
        view.addSubview(orderLabel)
        view.addSubview(pizzaNameLabel)
        view.addSubview(oneIngredientLabel)
        view.addSubview(twoIngredientLabel)
        view.addSubview(threeIngredientLabel)
        view.addSubview(fourIngredientLabel)
        view.addSubview(cardLabel)
        view.addSubview(cashLabel)
        view.addSubview(cardSwitch)
        view.addSubview(cashSwitch)
        view.addSubview(payButton)
    }
    
    private func createLabelTexts() {
        
        if ingrediants[0] != nil {
            oneIngredientLabel.text = ingrediants[0]
        }
        
        if ingrediants[1] != nil {
            twoIngredientLabel.text = ingrediants[1]
        }
        
        if ingrediants[2] != nil {
            threeIngredientLabel.text = ingrediants[2]
        }
        
        if ingrediants[3] != nil {
            fourIngredientLabel.text = ingrediants[3]
        }
    }
    
    // MARK: - Actions
    private func switchAction() {
        cardSwitch.addTarget(self, action: #selector(tapCardSwitchAction), for: .touchUpInside)
        cashSwitch.addTarget(self, action: #selector(tapCashSwitchAction), for: .touchUpInside)
    }
    
    @objc func tapCardSwitchAction() {
        if cardSwitch.isOn {
            cashSwitch.setOn(false, animated: true)
        }
    }
    
    @objc func tapCashSwitchAction() {
        if cashSwitch.isOn {
            cardSwitch.setOn(false, animated: true)
        }
    }
    
    private func buttonAction() {
        payButton.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
    }
    
    @objc func payButtonAction() {
        let alertController = UIAlertController(title: "Заказ выполнен!", message: massege, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Ok", style: .default) {_ in
            self.dismiss(animated: false)
            self.goToBackHandler?()
//            self.delegate?.goToBack()
        }
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
}
