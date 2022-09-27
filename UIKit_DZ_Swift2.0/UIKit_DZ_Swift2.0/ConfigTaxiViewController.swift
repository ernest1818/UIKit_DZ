//
//  ConfigTaxiViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 27.09.2022.
//

import UIKit

/// Контроллер настройки конфигураций выбора такси.
class ConfigTaxiViewController: UIViewController {
    
    public var cityOne = ""
    public var cityTwo = ""
    public var carStyle = ""
    private let pickTaxiStileLabel = UILabel()
    private let taxiImage = UIImageView()
    private var taxiSegmented = UISegmentedControl()
    private let toOrderButton = UIButton()
    private let orderLabel = UILabel()
    private let bagSwitch = UISwitch()
    private let bagLabel = UILabel()
    private let taxiClass = [UIImage(named: "econom.jpeg"), UIImage(named: "comfort.jpeg"),
                             UIImage(named: "comfort+.jpeg"), UIImage(named: "buisenes.jpeg")]
    private let menuSegment = ["Econom", "Comfort", "Comfort+", "Buisness"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurateAllViews()
    }
    
    private func configurateAllViews() {
        createTaxiImageView()
        createOrderLable()
        createTaxiSegment()
        toOrderAction()
        createBagLabel()
        createBagSwitch()
    }
    
    private func createOrderLable() {
        orderLabel.frame = CGRect(x: 0, y: 100, width: 390, height: 80)
        orderLabel.backgroundColor = UIColor.darkGray
        orderLabel.text = "Выберите интерисующий вас класс машины"
        orderLabel.layer.cornerRadius = 20
        orderLabel.layer.masksToBounds = true
        orderLabel.textColor = UIColor.systemYellow
        orderLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        orderLabel.textAlignment = .center
        view.addSubview(orderLabel)
    }
    
    private func createTaxiImageView() {
        taxiImage.frame = CGRect(x: 20, y: 200, width: 350, height: 250)
        taxiImage.image = taxiClass[0]
        taxiImage.contentMode = .scaleAspectFill
        taxiImage.backgroundColor = UIColor.systemYellow
        view.addSubview(taxiImage)
    }
    
    private func createBagLabel() {
        bagLabel.frame = CGRect(x: 20, y: 460, width: 100, height: 40)
        bagLabel.textColor = .white
        bagLabel.text = "Багаж"
        bagLabel.textAlignment = .center
        bagLabel.layer.cornerRadius = 10
        bagLabel.layer.masksToBounds = true
        bagLabel.backgroundColor = .red
        view.addSubview(bagLabel)
    }
    
    private func createBagSwitch() {
        bagSwitch.frame = CGRect(x: 320, y: 460, width: 100, height: 40)
        bagSwitch.backgroundColor = .white
        view.addSubview(bagSwitch)
    }
    
    private func createTaxiSegment() {
        taxiSegmented = UISegmentedControl(items: menuSegment)
        taxiSegmented.frame = CGRect(x: 20, y: 600, width: 350, height: 60)
        taxiSegmented.backgroundColor = UIColor.darkGray
        taxiSegmented.selectedSegmentTintColor = UIColor.systemYellow
        taxiSegmented.addTarget(self, action: #selector(selectedValueAction), for: .valueChanged)
        view.addSubview(taxiSegmented)
    }
    
    private func toOrderAction() {
        toOrderButton.frame = CGRect(x: 90, y: 700, width: 250, height: 80)
        toOrderButton.backgroundColor = UIColor.systemRed
        toOrderButton.setTitle("Заказать", for: .normal)
        toOrderButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        toOrderButton.layer.cornerRadius = 20
        toOrderButton.layer.masksToBounds = true
        toOrderButton.addTarget(self, action: #selector(orderAction), for: .touchUpInside)
        view.addSubview(toOrderButton)
    }
    
    @objc private func selectedValueAction(target: UISegmentedControl) {
        if target == taxiSegmented {
            let segmentIndex = target.selectedSegmentIndex
            taxiImage.image = taxiClass[segmentIndex]
            carStyle = target.titleForSegment(at: segmentIndex) ?? ""
        }
    }
    
    @objc private func orderAction() {
        let totalVC = TotalViewController()
        navigationController?.pushViewController(totalVC, animated: true)
        totalVC.information = "маршрут: \(cityOne)  - \(cityTwo)  на машине класса \(carStyle)"
        if bagSwitch.isOn {
            totalVC.bag = "да"
        } else {
            totalVC.bag = "нет"
        }
    }
    
}
