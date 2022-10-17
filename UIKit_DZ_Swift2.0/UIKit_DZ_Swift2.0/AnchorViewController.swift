//
//  AncorViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 15.10.2022.
//

import UIKit

///  Экран светофора с помощью якорей
final class AnchorViewController: UIViewController {
    
    // MARK: - Visual Components
    private var blackView = UIView.myView(color: .black)
    private let redView = UIView.myView(color: .red)
    private let yellowView = UIView.myView(color: .yellow)
    private let greenView = UIView.myView(color: .green)
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private  func setupUI() {
        createVCConfiguration()
        createYellowAnchor()
        createRedAnchor()
        createGreenAnchor()
        createBlackAnchor()
    }
    
    private func createVCConfiguration() {
        view.backgroundColor = .white
        title = "AnchorViewController"
        let myViews = [blackView, redView, yellowView, greenView]
        
        for views in myViews {
            view.addSubview(views)
        }
    }
    
    private func createYellowAnchor() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.235).isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }
    
    private func createRedAnchor() {
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor).constraint(
            equalTo: yellowView.heightAnchor,
            multiplier: 1.05).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
    }
    
    private func createGreenAnchor() {
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor).constraint(
            equalTo: yellowView.heightAnchor,
            multiplier: -1.05).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
    }
    
    private func createBlackAnchor() {
        blackView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true
        blackView.heightAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 3.15).isActive = true
        blackView.widthAnchor.constraint(equalTo: yellowView.widthAnchor,
                                         multiplier: 1,
                                         constant: 5).isActive = true
    }
}
