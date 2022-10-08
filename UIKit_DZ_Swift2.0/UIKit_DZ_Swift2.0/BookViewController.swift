//
//  BookViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// Экран читалки для книг
final class BookViewController: UIViewController {
    
    private enum Constants {
        static let minValue: Float = 12
        static let maxValue: Float = 30
        static let smallChar = "a"
        static let largeChar = "A"
        static let fontName = ["Verdana", "TimesNewRomanPSMT", "Palatino-Roman",
                               "ArialMT", "Courier", "Damascus", "Helvetica",
                               "Thonburi", "Didot", "GillSans", "GeezaPro"]
        static let fontBold = ["Verdana-Bold", "TimesNewRomanPS-BoldMT", "Palatino-Bold", "Arial-BoldMT"]
        static var current = ""
        static let key = "textColor"
        static let text = """
        Погашен в лампе свет, и ночь спокойна и ясна,
        На памяти моей встают былые времена,
        Плывут сказанья в вышине, как перья облаков,
        И в сердце странно и светло, печально и легко.
        И звезды ясно смотрят вниз, блаженствуя в ночи,
        Как будто смерти в мире нет, спокойны их лучи.
        Ты понял их язык без слов? Легенда есть одна,
        Я научился ей у звезд, послушай, вот она:
        Далёко, на звезде одной, в величьи зорь он жил,
        И на звезде другой — она, среди иных светил.
        И Салами? звалась она, и Зулами?т был он,
        И их любовь была чиста, как звездный небосклон.
        Они любили на земле в минувшие года,
        Но грех и горе, ночь и смерть их развели тогда.
        В покое смерти крылья им прозрачные даны,
        И жить на разных двух звезда?х они осуждены.
        Сны друг о друге в голубой пустыне снились им,
        Меж ними — солнечный простор сиял, неизмерим;
        Неисчислимые миры, созданье рук творца,
        Горели между ним и ей в сияньи без конца.
        И Зуламит в вечерний час, сжигаемый тоской,
        От мира к миру кинуть мост задумал световой;
        И Салами в тоске, как он, — и стала строить мост
        От берега своей звезды — к нему, чрез бездну звезд.
        С горячей верой сотни лет упорный длится труд,
        И вот — сияет Млечный Путь, и звездный мост сомкну?т;
        Весь охватив небесный свод, в зенит уходит он,
        И берег с берегом другим теперь соединен.
        И херувимов страх объял; они к творцу летят:
        «О, господи, что? Салами и Зуламит творят!»
        Но всемогущий им в ответ улыбкой просиял:
        «Я не хочу крушить того, что жар любви сковал».
        А Салами и Зуламит, едва окончен мост,
        Спешат в объятия любви, — светлейшая из звезд,
        Куда ни ступят, заблестит на радостном пути,
        Так после долгих бед душа готова вновь цвести.
        И всё, что радостью любви горело на земле,
        Что горем, смертью и грехом разлучено во мгле, —
        От мира к миру кинуть мост пусть только сил найдет, —
        Верь, обретет свою любовь, его тоска пройдет.

        24 января 1916
        """
    }
    
// MARK: - visual components
    private let myView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 700, width: 0, height: 0)
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    private let myTextView: UITextView = {
        let textView = UITextView()
        textView.text = Constants.text
        textView.frame = CGRect(x: 10, y: 60, width: 370, height: 500)
        textView.textColor = .black
        textView.backgroundColor = .cyan
        textView.layer.cornerRadius = 10
        textView.isSelectable = false
        textView.font = textView.font?.withSize(12)
        return textView
    }()
    
    private let textSizeSlider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 10, y: 600, width: 370, height: 10)
        slider.value = 12
        slider.minimumValue = Constants.minValue
        slider.maximumValue = Constants.maxValue
        return slider
    }()
    
    private let fontPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.frame = CGRect(x: 135, y: 670, width: 120, height: 120)
        return picker
    }()
    
    private let smallFontSizeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 770, width: 30, height: 30)
        button.setTitle(Constants.smallChar, for: .normal)
        button.backgroundColor = .green
        button.isSelected = true
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let largeFontSizeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 80, y: 770, width: 30, height: 30)
        button.setTitle(Constants.largeChar, for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    private let backgroundColorSwitsh: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.frame = CGRect(x: 300, y: 760, width: 0, height: 0)
        mySwitch.isOn = false
        return mySwitch
    }()
    
    private let redColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 70, y: 650, width: 30, height: 30)
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let blueColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 140, y: 650, width: 30, height: 30)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let orangeColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 210, y: 650, width: 30, height: 30)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let blackColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 280, y: 650, width: 30, height: 30)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        return button
    }()
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
// MARK: - Private methods
    private func setupUI() {
        view.addSubview(myTextView)
        view.addSubview(textSizeSlider)
        view.addSubview(smallFontSizeButton)
        view.addSubview(largeFontSizeButton)
        view.addSubview(backgroundColorSwitsh)
        view.addSubview(redColorButton)
        view.addSubview(blueColorButton)
        view.addSubview(orangeColorButton)
        view.addSubview(blackColorButton)
        view.addSubview(myView)
        createPicker()
        addActions()
    }
    
    private func addActions() {
        smallFontSizeButton.addTarget(self, action: #selector(smallFontSizeAction), for: .touchUpInside)
        largeFontSizeButton.addTarget(self, action: #selector(largeFontSizeAction), for: .touchUpInside)
        myTextView.font = UIFont(name: Constants.fontName[0], size: CGFloat(textSizeSlider.value))
        textSizeSlider.addTarget(self, action: #selector(changeTextSizeAction), for: .valueChanged)
        backgroundColorSwitsh.addTarget(self, action: #selector(changeBackgroundColorAction), for: .valueChanged)
        redColorButton.addTarget(self, action: #selector(redButtonAction), for: .touchUpInside)
        blueColorButton.addTarget(self, action: #selector(blueButtonAction), for: .touchUpInside)
        orangeColorButton.addTarget(self, action: #selector(orangeButtonAction), for: .touchUpInside)
        blackColorButton.addTarget(self, action: #selector(blackButtonAction), for: .touchUpInside)
    }
    
    private func createPicker() {
        fontPicker.dataSource = self
        fontPicker.delegate = self
        fontPicker.alpha = 0.9
        fontPicker.setValue(UIColor.gray, forKey: Constants.key)
        view.addSubview(fontPicker)
    }
    
    private func setChangeConfigurate() {
        view.backgroundColor = .black
        myTextView.backgroundColor = .black
        blackColorButton.layer.shadowRadius = 3
        blackColorButton.layer.shadowOpacity = 0.7
        blackColorButton.layer.shadowColor = UIColor.white.cgColor
    }
    
// MARK: - Private Actions
    @objc private func changeTextSizeAction() {
        myTextView.font = myTextView.font?.withSize(CGFloat(textSizeSlider.value))
    }
    
    @objc private func smallFontSizeAction() {
        smallFontSizeButton.setTitleColor(.black, for: .normal)
        smallFontSizeButton.isSelected = true
        largeFontSizeButton.setTitleColor(.white, for: .normal)
        myTextView.font = UIFont(name: Constants.current, size: CGFloat(textSizeSlider.value))
    }
    
    @objc private func largeFontSizeAction() {
        largeFontSizeButton.setTitleColor(.black, for: .normal)
        smallFontSizeButton.setTitleColor(.white, for: .normal)
        smallFontSizeButton.isSelected = false
        myTextView.font = UIFont(name: Constants.current, size: CGFloat(textSizeSlider.value))?.bold
    }
    
    @objc private func changeBackgroundColorAction() {
        if backgroundColorSwitsh.isOn {
            setChangeConfigurate()
            if myTextView.textColor == .black {
                myTextView.textColor = .white
            } else {
                myTextView.textColor = myTextView.textColor
            }
        } else {
            view.backgroundColor = .white
            myTextView.backgroundColor = .cyan
            if myTextView.textColor == .white {
                myTextView.textColor = .black
            } else {
                myTextView.textColor = myTextView.textColor
            }
        }
    }
    
    @objc private func redButtonAction() {
        myTextView.textColor = .red
    }
    
    @objc private func blueButtonAction() {
        myTextView.textColor = .blue
    }
    
    @objc private func orangeButtonAction() {
        myTextView.textColor = .orange
    }
    
    @objc private func blackButtonAction() {
        myTextView.textColor = .black
    }
    
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension BookViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constants.fontName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return Constants.fontName[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Constants.current = Constants.fontName[row]
        if smallFontSizeButton.isSelected {
            myTextView.font = UIFont(name: Constants.fontName[row], size: CGFloat(textSizeSlider.value))
        } else {
            myTextView.font = UIFont(name: Constants.fontName[row], size: CGFloat(textSizeSlider.value))?.bold
        }
    }
}

// MARK: - расширение для UIFont, которое позволяет добвлять жирный шрифт
extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    
    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var atributes = fontDescriptor.fontAttributes
        var traits = (atributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]
        
        traits[.weight] = weight
        
        atributes[.name] = nil
        atributes[.traits] = traits
        atributes[.family] = familyName
        
        let descriptor = UIFontDescriptor(fontAttributes: atributes)
        
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
