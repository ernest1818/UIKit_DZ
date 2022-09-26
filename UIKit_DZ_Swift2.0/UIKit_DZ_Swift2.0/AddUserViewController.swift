//
//  AddUserViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 26.09.2022.
//

import UIKit

/// контроллер добавления информации о новом человеке
final class AddUserViewController: UIViewController {
    
    // Константы классов...
    private let cancelButton = UIButton()
    private let addButton = UIButton()
    private let addPhotoButton = UIButton()
    private let photo = UIImageView()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let ageLebel = UILabel()
    private let genderLabel = UILabel()
    private let instagrammLabel = UILabel()
    private let nameView = UIView()
    private let dateView = UIView()
    private let ageView = UIView()
    private let genderView = UIView()
    private let instaView = UIView()
    private let nameText = UITextField()
    private let dateText = UITextField()
    private let ageText = UITextField()
    private let genderText = UITextField()
    private let instagramText = UITextField()
    private let pickerDate = UIDatePicker()
    private let ageCouners = Array(0...99)
    private let agePicker = UIPickerView()
    private let genderCount = ["Женский", "Мужской"]
    private let genderPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAllViews()
    }
    // MARK: - Actions
    @objc func photoAdd() {
        print("rrr")
    }
    
    @objc func instaTargetAction() {
        let instAlertConroller = UIAlertController(title: "Введите свое имя в Instagram",
                                                   message: "",
                                                   preferredStyle: .alert)
        let instaAlertAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        self.present(instAlertConroller, animated: true)
        
        instAlertConroller.addAction(instaAlertAction)
        instAlertConroller.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.instagramText.text = instAlertConroller.textFields?.first?.text
        }))
        
        instAlertConroller.addTextField { $0.placeholder = "Например valera937" }
    }
    
    @objc func selCancelButtAction() {
        dismiss(animated: true)
    }
    
    @objc func handleDatePicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateText.text = dateFormatter.string(from: pickerDate.date)
        dateText.resignFirstResponder()
    }
    // MARK: - private Funcs
    private func setAllViews() {
        cancelButtAction()
        addButtAction()
        createNameLabel()
        createDateLabel()
        createGenderLabel()
        createAgeLabel()
        createInstaLabel()
        createNameTextField()
        createDateTextField()
        createAgeTextField()
        createGenderTextField()
        createInstaTextField()
        nameLineView()
        ageLineView()
        dateLineView()
        genderLineView()
        instalineView()
        createUserPhotos()
        createPhotoButtonAction()
    }
    // MARK: - Лейблы имя, дата рождения, возраст, пол, инстаграм
    private func createNameLabel() {
        nameLabel.frame = CGRect(x: 35, y: 290, width: 40, height: 25)
        nameLabel.text = "Имя"
        nameLabel.textColor = .systemBlue
        view.addSubview(nameLabel)
    }
    
    private func createDateLabel() {
        dateLabel.frame = CGRect(x: 35, y: 380, width: 40, height: 25)
        dateLabel.text = "Дата"
        dateLabel.textColor = .systemBlue
        view.addSubview(dateLabel)
    }
    
    private func createAgeLabel() {
        ageLebel.frame = CGRect(x: 35, y: 470, width: 90, height: 25)
        ageLebel.text = "Возраст"
        ageLebel.textColor = .systemBlue
        view.addSubview(ageLebel)
    }
    
    private func createGenderLabel() {
        genderLabel.frame = CGRect(x: 35, y: 560, width: 40, height: 25)
        genderLabel.text = "Пол"
        genderLabel.textColor = .systemBlue
        view.addSubview(genderLabel)
    }
    
    private func createInstaLabel() {
        instagrammLabel.frame = CGRect(x: 35, y: 650, width: 90, height: 25)
        instagrammLabel.text = "Instgram"
        instagrammLabel.textColor = .systemBlue
        view.addSubview(instagrammLabel)
    }
    
    // MARK: - картинка
    
    private func createUserPhotos() {
        photo.frame = CGRect(x: 125, y: 60, width: 150, height: 150)
        photo.backgroundColor = .systemGray2
        photo.tintColor = .gray
        photo.layer.cornerRadius = 75
        photo.layer.masksToBounds = true
        photo.image = UIImage.init(systemName: "person.fill")
        view.addSubview(photo)
    }
    
    // MARK: - линии под текстфилды
    
    private func nameLineView() {
        nameView.frame = CGRect(x: 35, y: 355, width: 300, height: 1)
        nameView.backgroundColor = .systemGray2
        view.addSubview(nameView)
    }
    
    private func dateLineView() {
        dateView.frame = CGRect(x: 35, y: 445, width: 300, height: 1)
        dateView.backgroundColor = .systemGray2
        view.addSubview(dateView)
    }
    
    private func ageLineView() {
        ageView.frame = CGRect(x: 35, y: 535, width: 300, height: 1)
        ageView.backgroundColor = .systemGray2
        view.addSubview(ageView)
    }
    
    private func genderLineView() {
        genderView.frame = CGRect(x: 35, y: 625, width: 300, height: 1)
        genderView.backgroundColor = .systemGray2
        view.addSubview(genderView)
    }
    
    private func instalineView() {
        instaView.frame = CGRect(x: 35, y: 715, width: 300, height: 1)
        instaView.backgroundColor = .systemGray2
        view.addSubview(instaView)
    }
    
    // MARK: - Текстфилды и пикеры в них
    private func createNameTextField() {
        nameText.frame = CGRect(x: 35, y: 300, width: 300, height: 70)
        nameText.placeholder = "Введите имя"
        view.addSubview(nameText)
    }
    
    private func createDateTextField() {
        dateText.frame = CGRect(x: 35, y: 390, width: 300, height: 70)
        dateText.placeholder = "Введите дату"
        pickerDate.datePickerMode = .dateAndTime
        pickerDate.preferredDatePickerStyle = .wheels
        pickerDate.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        dateText.inputView = pickerDate
        view.addSubview(dateText)
    }
    
    private func createAgeTextField() {
        ageText.frame = CGRect(x: 35, y: 480, width: 300, height: 70)
        ageText.placeholder = "Добавит"
        agePicker.dataSource = self
        agePicker.delegate = self
        ageText.inputView = agePicker
        view.addSubview(ageText)
        
    }
    
    private func createGenderTextField() {
        genderText.frame = CGRect(x: 35, y: 570, width: 300, height: 70)
        genderText.placeholder = "Добавить"
        view.addSubview(genderText)
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderText.inputView = genderPicker
    }
    
    // Instgramm  с аллертом и добалением
    private func createInstaTextField() {
        instagramText.text = ""
        instagramText.frame = CGRect(x: 35, y: 660, width: 300, height: 70)
        instagramText.placeholder = "Добавить"
        instagramText.addTarget(self, action: #selector(instaTargetAction), for: .touchDown)
        view.addSubview(instagramText)
    }
    
    // MARK: - actions
    private func createPhotoButtonAction() {
        addPhotoButton.frame = CGRect(x: 125, y: 230, width: 150, height: 30)
        addPhotoButton.setTitle("Изменить фото", for: .normal)
        addPhotoButton.backgroundColor = .systemBackground
        addPhotoButton.setTitleColor(.systemBlue, for: .normal)
        addPhotoButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        addPhotoButton.addTarget(self, action: #selector(photoAdd), for: .valueChanged)
        view.addSubview(addPhotoButton)
    }
    
    private func addButtAction() {
        addButton.frame = CGRect(x: 290, y: 20, width: 100, height: 30)
        addButton.setTitle("Добавить", for: .normal)
        addButton.backgroundColor = .systemBackground
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        view.addSubview(addButton)
    }
    
    private func cancelButtAction() {
        cancelButton.frame = CGRect(x: 10, y: 20, width: 80, height: 30)
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.backgroundColor = .systemBackground
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        cancelButton.addTarget(self, action: #selector(selCancelButtAction), for: .touchUpInside)
        view.addSubview(cancelButton)
    }
    
}
// MARK: - сдесь extension для AddUserViewController: - UIPickerViewDataSource, - UIPickerViewDelegate
extension AddUserViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerDate:
            return 20
        case genderPicker:
            return genderCount.count
        case agePicker:
            return ageCouners.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case agePicker:
            return "\(ageCouners[row])"
        case genderPicker:
            return genderCount[row]
        default:
            return "Сработал return"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case agePicker:
            ageText.text = "\(ageCouners[row])"
            ageText.resignFirstResponder()
        case genderPicker:
            genderText.text = "\(genderCount[row])"
            genderText.resignFirstResponder()
        default:
            break
            
        }
    }
}
