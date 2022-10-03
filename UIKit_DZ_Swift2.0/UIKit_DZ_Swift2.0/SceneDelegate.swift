//
//  SceneDelegate.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 24.09.2022.
//

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = scene as? UIWindowScene else { return }
            let window = UIWindow(windowScene: windowScene)
            let labelVC = LabelViewController()
            let secondVC = SecondViewController()
            let navigationController = UINavigationController(rootViewController: labelVC)
            let tabBarController = UITabBarController()
            tabBarController.setViewControllers([navigationController, secondVC], animated: true)
            window.rootViewController = tabBarController
            self.window = window
            window.makeKeyAndVisible()
            
    }
}
