//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// Начальный контроллер приложения по поиску такси
final class BeginViewController: UIViewController {
    
    private let backgroundImageView = UIImageView()
    private let leaveLabel = UILabel()
    private let enterLabel = UILabel()
    private let goToConfigButton = UIButton()
    private let outCityTextField = UITextField()
    private let inCityTextField = UITextField()
    private let cityPicker = UIPickerView()
    private let cityArray = ["Симферополь", "Ялта", "Алушта", "Севастополь",
                     "Керчь", "Феодосия", "Судак", "Джанкой", "Евпатория",
                     "Старый Крым", "Семеиз", "Мрия", "Армянск", "Саки"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateAllViewsAndActions()
    }
    
    private func configurateAllViewsAndActions() {
        createLabels()
        createTextFields()
        createButtonAction()
        configurateView()
    }
    
    private func configurateView() {
        view.backgroundColor = .white
        title = "UpTaxi"
    }
    
    private func createBackgroundImage() {
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 390, height: 840)
        backgroundImageView.image = UIImage(named: "map")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
    }
    
    private func createLabels() {
        leaveLabel.frame = CGRect(x: 20, y: 100, width: 70, height: 30)
        leaveLabel.backgroundColor = .red
        leaveLabel.textColor = .white
        leaveLabel.layer.cornerRadius = 10
        leaveLabel.layer.masksToBounds = true
        leaveLabel.text = "Откуда"
        leaveLabel.textAlignment = .center
        view.addSubview(leaveLabel)
        
        enterLabel.frame = CGRect(x: 20, y: 145, width: 70, height: 30)
        enterLabel.backgroundColor = .red
        enterLabel.textColor = .white
        enterLabel.layer.cornerRadius = 10
        enterLabel.layer.masksToBounds = true
        enterLabel.text = "Кудa"
        enterLabel.textAlignment = .center
        view.addSubview(enterLabel)
    }
    // MARK: - здесь вставлен пикер и в этом же методе пикер подписан на делегат
    private func createTextFields() {
        outCityTextField.frame = CGRect(x: 95, y: 100, width: 280, height: 30)
        outCityTextField.backgroundColor = .systemGray6
        outCityTextField.placeholder = "  Укажите адрес место вызова машины"
        outCityTextField.layer.cornerRadius = 10
        outCityTextField.layer.masksToBounds = true
        outCityTextField.inputView = cityPicker
        view.addSubview(outCityTextField)
        
        inCityTextField.frame = CGRect(x: 95, y: 145, width: 280, height: 30)
        inCityTextField.backgroundColor = .systemGray6
        inCityTextField.placeholder = "  Укажите адрес места пребытия"
        inCityTextField.layer.cornerRadius = 10
        inCityTextField.layer.masksToBounds = true
        inCityTextField.inputView = cityPicker
        cityPicker.dataSource = self
        cityPicker.delegate = self
        view.addSubview(inCityTextField)
    }
    
    private func createButtonAction() {
        goToConfigButton.frame = CGRect(x: 30, y: 750, width: 330, height: 50)
        goToConfigButton.backgroundColor = .red
        goToConfigButton.tintColor = .white
        goToConfigButton.setTitle("Выбрать машину", for: .normal)
        goToConfigButton.layer.cornerRadius = 10
        goToConfigButton.layer.masksToBounds = true
        goToConfigButton.addTarget(self, action: #selector(goToConfigAction), for: .touchUpInside)
        view.addSubview(goToConfigButton)
    }
    
    @objc private func goToConfigAction() {
        let alertController = UIAlertController(title: "Внимание",
                                                message: """
                                                Ваш маршрут \(outCityTextField.text ?? "") -
                                                \(inCityTextField.text ?? "")
                                                """,
                                                preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Отмена", style: .cancel)
        let alertControolerActionOk = UIAlertAction(title: "Да", style: .default) {_ in
            let configVC = ConfigTaxiViewController()
            self.navigationController?.pushViewController(configVC, animated: true)
            configVC.cityOne = self.outCityTextField.text ?? ""
            configVC.cityTwo = self.inCityTextField.text ?? ""
        }
        alertController.addAction(alertControllerAction)
        alertController.addAction(alertControolerActionOk)
        present(alertController, animated: true)
    }
    
}

extension BeginViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray.sorted()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if outCityTextField.isEditing {
            outCityTextField.text = "  \(cityArray.sorted()[row])"
            outCityTextField.resignFirstResponder()
        } else if inCityTextField.isEditing {
            inCityTextField.text = "  \(cityArray.sorted()[row])"
            inCityTextField.resignFirstResponder()
        }
    }
}
