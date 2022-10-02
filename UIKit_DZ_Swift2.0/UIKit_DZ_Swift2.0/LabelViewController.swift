//
//  LabelViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

///  содержит класс показывающий возможности UILabel
final class LabelViewController: UIViewController {
    
    private enum Constants {
        static var alertTitle: String = "Введите пожалуйста текст"
        static var constantY: CGFloat = 250
        static let colorArray = ["black", "green", "blue", "orange", "yellow", "red"]
    }

// MARK: - Private variables

    private lazy var myLabel: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 30, y: 100, width: 330, height: 120)
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var colorOfLabelPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 30, y: Constants.constantY, width: 160, height: 100)
        pickerView.backgroundColor = .yellow
        pickerView.layer.cornerRadius = 10
        pickerView.layer.masksToBounds = true
        return pickerView
    }()
    
    private lazy var lineOfLabelPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 200, y: Constants.constantY, width: 160, height: 100)
        pickerView.backgroundColor = .yellow
        pickerView.layer.cornerRadius = 10
        pickerView.layer.masksToBounds = true
        return pickerView
    }()
    
    private lazy var labelSlider: UISlider = {
       let slider = UISlider()
        slider.frame = CGRect(x: 40, y: 400, width: 310, height: 8)
        slider.minimumValue = 1
        slider.maximumValue = 64
        slider.minimumTrackTintColor = .orange
        slider.maximumTrackTintColor = .yellow
        slider.value = Float(self.myLabel.font.pointSize)
        slider.addTarget(self, action: #selector(addFontChangeAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var uppercasedButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 30, y: 450, width: 60, height: 60)
        button.setTitle("Aa", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(labelTextUppercasedAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var labelWeightButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 100, y: 450, width: 60, height: 60)
        button.setTitle("B", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .heavy)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(labelWeightAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var labelShadowButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 170, y: 450, width: 60, height: 60)
        button.setTitle("Тень", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(labelShadowAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var labelBreakModeButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 240, y: 450, width: 60, height: 60)
        button.setTitle("Line break", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 11, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addBreakModeChangeAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var labelDownLineButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 310, y: 450, width: 60, height: 60)
        button.setTitle("Down line", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 11, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addDownLineAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private var flag = true
    private var number = true
    private var offOn = true
    private var count = 0
    private var flagTwo = true
    
// MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        sutupView()
    }
    
// MARK: - Private methods
    private func sutupView() {
        title = "<LabelController>"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTextAction))
        navigationItem.rightBarButtonItem?.tintColor = .white
        tabBarItem = .init(tabBarSystemItem: .recents, tag: 0)
        view.backgroundColor = .cyan
        addSunview()
        updateDataSoursAndDelegate()
    }
    
    private func addSunview() {
        view.addSubview(myLabel)
        view.addSubview(colorOfLabelPicker)
        view.addSubview(lineOfLabelPicker)
        view.addSubview(labelSlider)
        view.addSubview(uppercasedButton)
        view.addSubview(labelWeightButton)
        view.addSubview(labelShadowButton)
        view.addSubview(labelBreakModeButton)
        view.addSubview(labelDownLineButton)
    }
    
    private func updateDataSoursAndDelegate() {
        colorOfLabelPicker.dataSource = self
        colorOfLabelPicker.delegate = self
        lineOfLabelPicker.dataSource = self
        lineOfLabelPicker.delegate = self
    }
    
// MARK: - Actions
    @objc private func labelTextUppercasedAction() {
        
        if flag {
            myLabel.text = myLabel.text?.uppercased()
            flag = false
        } else {
            myLabel.text = myLabel.text?.lowercased()
            flag = true
        }
    }
    
    @objc private func labelWeightAction() {
        
        if number {
            myLabel.font = .systemFont(ofSize: CGFloat(labelSlider.value), weight: .heavy)
            number = false
        } else {
            myLabel.font = .systemFont(ofSize: CGFloat(labelSlider.value), weight: .light)
            number = true
        }
    }
    
    @objc private func labelShadowAction() {
        if offOn {
            myLabel.shadowOffset = .init(width: 3, height: 2)
            myLabel.shadowColor = .cyan
            print("true")
            offOn = false
        } else {
            myLabel.shadowColor = nil
            myLabel.shadowOffset = CGSize(width: 0, height: 0)
            offOn = true
        }
    }
    
    @objc private func addTextAction() {
        let alertController = UIAlertController(title: Constants.alertTitle,
                                                message: nil,
                                                preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "ok", style: .default) { _ in
            let text = alertController.textFields?.first?.text
            self.myLabel.text = text
        }
        
        alertController.addAction(alertControllerAction)
        alertController.addTextField { $0.placeholder = Constants.alertTitle }
        present(alertController, animated: true)
    }
    
    @objc private func addFontChangeAction() {
        myLabel.font = .systemFont(ofSize: CGFloat(labelSlider.value), weight: .semibold)
    }
    
    @objc private func addBreakModeChangeAction() {
        switch count {
        case 0:
            myLabel.lineBreakMode = .byCharWrapping
            count = 1
        case 1:
            myLabel.lineBreakMode = .byWordWrapping
            count = 0
        default:
            break
            
        }
    }
    
    @objc private func addDownLineAction() {
        if flagTwo {
            myLabel.underline()
            flagTwo = false
        } else {
            myLabel.attributedText = NSAttributedString(string: myLabel.text ?? "")
            flagTwo = true
        }
    }
}

// MARK: Extensions - UIPickerViewDataSource, UIPickerViewDelegate
extension LabelViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case colorOfLabelPicker:
            return Constants.colorArray.count
        case lineOfLabelPicker:
            return 5
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case colorOfLabelPicker:
            return Constants.colorArray[row]
        case lineOfLabelPicker:
            return "\(row)"
        default:
            return "error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case colorOfLabelPicker:
            let colors = [UIColor.black, UIColor.green, UIColor.blue, UIColor.orange, UIColor.yellow, UIColor.red]
            myLabel.textColor = colors[row]
        case lineOfLabelPicker:
            myLabel.numberOfLines = row
        default:
            break
        }
    }
}

// MARK: - Расширили UILabel путем добавления к тексту нижнего подчеркивания
extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.attributedText = attributedString
        }
    }
}
