//
//  TotalViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 27.09.2022.
//

import UIKit

/// Итоговый контроллер показывает выбранные клиентом элементы
final class TotalViewController: UIViewController {
    
    public var information = ""
    public var bag = ""
    
    private let orderLabel = UILabel()
    private let readyButton = UIButton()
    private let taxiClassLabel = UILabel()
    private let bagLabel = UILabel()
    private let slider = UISlider()
    private let chaiCountLabel = UILabel()
    private let chaiLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createALLViews()
    }
    
    private func createALLViews() {
        createlabel()
        createReadyButon()
        createBagLabel()
        createSlider()
        createChaiCountLabel()
        createChaiLabel()
    }
    
    private func createlabel() {
        orderLabel.frame = CGRect(x: 7, y: 100, width: 390, height: 70)
        orderLabel.backgroundColor = .darkGray
        orderLabel.text = information
        orderLabel.textColor = .systemYellow
        orderLabel.textAlignment = .center
        orderLabel.lineBreakMode = .byWordWrapping
        orderLabel.numberOfLines = 0
        orderLabel.layer.cornerRadius = 20
        orderLabel.layer.masksToBounds = true
        view.addSubview(orderLabel)
    }
    
    private func createSlider() {
        slider.frame = CGRect(x: 20, y: 600, width: 300, height: 10)
        slider.minimumTrackTintColor = .orange
        slider.maximumTrackTintColor = .red
        slider.tintColor = .red
        slider.minimumValue = 0.0
        slider.maximumValue = 1000.0
        slider.addTarget(self, action: #selector(sliderValueChangeAction), for: .valueChanged)
        view.addSubview(slider)
    }
    
    private func createChaiCountLabel() {
        chaiCountLabel.frame = CGRect(x: 335, y: 590, width: 50, height: 20)
        chaiCountLabel.backgroundColor = .red
        chaiCountLabel.text = "0p."
        chaiCountLabel.textAlignment = .center
        chaiCountLabel.textColor = .white
        chaiCountLabel.layer.cornerRadius = 3
        chaiCountLabel.layer.masksToBounds = true
        view.addSubview(chaiCountLabel)
    }
    
    private func createChaiLabel() {
        chaiLabel.frame = CGRect(x: 50, y: 540, width: 290, height: 40)
        chaiLabel.backgroundColor = .red
        chaiLabel.text = "ЧАЕВЫЕ ВОДИТЕЛЮ"
        chaiLabel.textColor = .white
        chaiLabel.font = .systemFont(ofSize: 20, weight: .bold)
        chaiLabel.textAlignment = .center
        chaiLabel.layer.cornerRadius = 10
        chaiLabel.layer.masksToBounds = true
        view.addSubview(chaiLabel)
    }
    
    private func createBagLabel() {
        bagLabel.frame = CGRect(x: 7, y: 200, width: 150, height: 70)
        bagLabel.backgroundColor = .darkGray
        bagLabel.text = " Багаж: - \(bag)"
        bagLabel.textColor = .systemYellow
        bagLabel.textAlignment = .center
        bagLabel.numberOfLines = 0
        bagLabel.layer.cornerRadius = 20
        bagLabel.layer.masksToBounds = true
        view.addSubview(bagLabel)
    }
    
    private func createReadyButon() {
        readyButton.frame = CGRect(x: 70, y: 700, width: 250, height: 80)
        readyButton.setTitle("Готово", for: .normal)
        readyButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        readyButton.backgroundColor = .systemRed
        readyButton.layer.cornerRadius = 20
        readyButton.layer.masksToBounds = true
        readyButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        view.addSubview(readyButton)
    }
    
    @objc func sliderValueChangeAction() {
        chaiCountLabel.text = "\(Int(slider.value))p."
    }
    
    @objc func backButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}
