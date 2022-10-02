//
//  SecondViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 01.10.2022.
//

import UIKit

/// Второй класс для TabBarController
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarItem = .init(tabBarSystemItem: .bookmarks, tag: 1)
    }
  
}
