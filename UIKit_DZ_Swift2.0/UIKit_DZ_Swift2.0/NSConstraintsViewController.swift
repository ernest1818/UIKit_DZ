//
//  NSConstraintsViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 15.10.2022.
//

import UIKit

/// Экран светофора с помощью констреинтов
final class NSConstraintsViewController: UIViewController {
    
    // MARK: - Visual Components
    private let blackView = UIView.myView(color: .black)
    private let redView = UIView.myView(color: .red)
    private let yellowView = UIView.myView(color: .yellow)
    private let greenView = UIView.myView(color: .green)
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        title = "NSConstraintsViewController"
        let myViews = [blackView, redView, yellowView, greenView]
        
        for views in myViews {
            view.addSubview(views)
        }
        
        creatYellowConstraint()
        creatRedConstraint()
        creatGreenConstraint()
        creatBlackConstraint()
    }
    
    private func creatYellowConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: yellowView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: yellowView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: yellowView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: yellowView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .height,
                               multiplier: 0.236, constant: 0)
        ])
    }
    
    private func creatRedConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: redView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: redView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .centerY,
                               multiplier: 0.5,
                               constant: 0),
            NSLayoutConstraint(item: redView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: redView,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: redView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .height,
                               multiplier: 1, constant: 0)
        ])
    }
    
    private func creatGreenConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: greenView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: greenView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .centerY,
                               multiplier: 1.5,
                               constant: 0),
            NSLayoutConstraint(item: greenView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: greenView,
                               attribute: .height,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: greenView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .height,
                               multiplier: 1, constant: 0)
        ])
    }
    
    private func creatBlackConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: blackView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: blackView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: blackView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .width,
                               multiplier: 1.05,
                               constant: 0),
            NSLayoutConstraint(item: blackView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: yellowView,
                               attribute: .height,
                               multiplier: 3.15, constant: 0),
        ])
    }
}

// MARK: - Extension для класса UIView
extension UIView {
    static func myView(color: UIColor) -> UIView {
        let myView = UIView()
        myView.backgroundColor = color
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }
}
