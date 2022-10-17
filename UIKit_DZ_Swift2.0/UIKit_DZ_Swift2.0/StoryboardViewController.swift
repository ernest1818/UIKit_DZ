//
//  ViewController.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// Экран на котором сделан сфетофор сторибордом
final class StoryboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
    }
    
    private func setupTitle() {
        title = "StoryboardViewController"
    }
}
