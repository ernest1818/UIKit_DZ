//
//  BirthdaysViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 25.09.2022.
//

import UIKit

/// BirthdaysViewController - контроллер в котором отображаются дни рождения указанных Вами людей
final class BirthdaysViewController: UIViewController {

    private let addButton = UIButton()
    private let birthView = UIView()
    private let imageOne = UIImageView()
    private let imageTwo = UIImageView()
    private let imageThree = UIImageView()
    private let imageOneView = UIView()
    private let imageTwoView = UIView()
    private let imageThreeView = UIView()
    private let labelNameOne = UILabel()
    private let labelNameTwo = UILabel()
    private let labelNameThre = UILabel()
    private let textLabel = UILabel()
    private let textLabelOne = UILabel()
    private let textLabelTwo = UILabel()
    private let dayOneLabel = UILabel()
    private let dayTwoLabel = UILabel()
    private let dayThreeLabel = UILabel()
    private let dayOne = 18
    private let dayTwo = 28
    private let dayThree = 53
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAllViews()
        addNavigationConfigurate()
    }
   // MARK: - Приватные функции
    private func setAllViews() {
        createImages()
        createNameLabels()
        createLineViews()
        createTextLabels()
        createDaysLabel()
        addNavigationConfigurate()
    }
    // MARK: - создали картинки
    private func createImages() {
        // Фото первого
        imageOne.frame = CGRect(x: 10, y: 110, width: 50, height: 50)
        imageOne.image = UIImage(systemName: "person.fill", compatibleWith: nil)
        imageOne.tintColor = .gray
        imageOne.layer.cornerRadius = 25
        imageOne.layer.masksToBounds = true
        imageOne.backgroundColor = .systemGray4
        view.addSubview(imageOne)
        
        // Фото второго
        imageTwo.frame = CGRect(x: 10, y: 185, width: 50, height: 50)
        imageTwo.image = UIImage(systemName: "person.fill", compatibleWith: nil)
        imageTwo.tintColor = .gray
        imageTwo.layer.cornerRadius = 25
        imageTwo.layer.masksToBounds = true
        imageTwo.backgroundColor = .systemGray4
        view.addSubview(imageTwo)
        
        // Фото третьего
        imageThree.frame = CGRect(x: 10, y: 260, width: 50, height: 50)
        imageThree.image = UIImage(systemName: "person.fill", compatibleWith: nil)
        imageThree.tintColor = .gray
        imageThree.layer.cornerRadius = 25
        imageThree.layer.masksToBounds = true
        imageThree.backgroundColor = .systemGray4
        view.addSubview(imageThree)
    }
    // MARK: - создали лейблы с именами юзеров
    private func createNameLabels() {
        
        // Имя первого человека
        labelNameOne.frame = CGRect(x: 70, y: 100, width: 200, height: 40)
        labelNameOne.text = "Jeremy"
        labelNameOne.textColor = .black
        labelNameOne.font = .systemFont(ofSize: 18, weight: .medium)
        view.addSubview(labelNameOne)
        
        // имя второго человека
        labelNameTwo.frame = CGRect(x: 70, y: 175, width: 200, height: 40)
        labelNameTwo.text = "Maria Lui"
        labelNameTwo.textColor = .black
        labelNameTwo.font = .systemFont(ofSize: 18, weight: .medium)
        view.addSubview(labelNameTwo)
        
        // имя третьего человека
        labelNameThre.frame = CGRect(x: 70, y: 250, width: 200, height: 40)
        labelNameThre.text = "Jony Stark"
        labelNameThre.textColor = .black
        labelNameThre.font = .systemFont(ofSize: 18, weight: .medium)
        view.addSubview(labelNameThre)
        
    }
    // MARK: - создали лейблы с описанием дня рождения
    private func createTextLabels() {
        textLabel.frame = CGRect(x: 70, y: 120, width: 300, height: 40)
        textLabel.text = "10 марта в среду исполняется 25 лет"
        textLabel.textColor = .systemGray
        textLabel.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(textLabel)
        
        textLabelOne.frame = CGRect(x: 70, y: 195, width: 300, height: 40)
        textLabelOne.text = "30 марта в четверг исполнится 20 лет"
        textLabelOne.textColor = .systemGray
        textLabelOne.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(textLabelOne)
        
        textLabelTwo.frame = CGRect(x: 70, y: 270, width: 300, height: 40)
        textLabelTwo.text = "25 апреля в субботу исполнится 25 лет"
        textLabelTwo.textColor = .systemGray
        textLabelTwo.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(textLabelTwo)
        
    }
    // MARK: - создали лейблы с указанием дней до дня рождения
    private func createDaysLabel() {
        
        dayOneLabel.frame = CGRect(x: 315, y: 100, width: 60, height: 40)
        dayOneLabel.text = "\(dayOne) дней"
        dayOneLabel.textColor = .systemGray
        dayOneLabel.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(dayOneLabel)
        
        dayTwoLabel.frame = CGRect(x: 315, y: 175, width: 60, height: 50)
        dayTwoLabel.text = "\(dayTwo) дней"
        dayTwoLabel.textColor = .systemGray
        dayTwoLabel.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(dayTwoLabel)
        
        dayThreeLabel.frame = CGRect(x: 315, y: 250, width: 60, height: 50)
        dayThreeLabel.text = "\(dayThree) дней"
        dayThreeLabel.textColor = .systemGray
        dayThreeLabel.font = .systemFont(ofSize: 15, weight: .medium)
        view.addSubview(dayThreeLabel)
    }
    
    private func createLineViews() {
        imageOneView.frame = CGRect(x: 10, y: 167, width: 450, height: 1)
        imageOneView.backgroundColor = .systemGray3
        view.addSubview(imageOneView)
        
        imageTwoView.frame = CGRect(x: 10, y: 242, width: 430, height: 1)
        imageTwoView.backgroundColor = .systemGray3
        view.addSubview(imageTwoView)
        
        imageThreeView.frame = CGRect(x: 10, y: 317, width: 430, height: 1)
        imageThreeView.backgroundColor = .systemGray3
        view.addSubview(imageThreeView)
    }
        
    private func addNavigationConfigurate() {
        title = "Birthday"
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add,
                                                  target: self,
                                                  action: #selector(addNewUserAction))
    }
    
    @objc private func addNewUserAction() {
        let addVC = AddUserViewController()
        present(addVC, animated: true)
    }
}
