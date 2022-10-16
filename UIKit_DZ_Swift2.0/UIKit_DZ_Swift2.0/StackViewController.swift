//
//  StackViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 16.10.2022.
//

import UIKit

/// Экран светофора на StackView
final class StackViewController: UIViewController {
    
    // MARK: - Visual Components
    private let redView = UIView.myView(color: .red)
    private let yellowView = UIView.myView(color: .yellow)
    private let greenView = UIView.myView(color: .green)
    
    private lazy var myStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func goToRootNavController(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        title = "StackViewController"
        view.addSubview(myStackView)
        stackViewAnchor()
        createRedViewAnchor()
        createYellowViewAnchor()
        createGreenViewAnchor()
    }
    
    private func stackViewAnchor() {
        myStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        myStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func createRedViewAnchor() {
        redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
    }
    
    private func createYellowViewAnchor() {
        yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
    }
    
    private func createGreenViewAnchor() {
        greenView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
    }
}
