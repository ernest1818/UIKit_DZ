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
            if let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                let viewController = BeginViewController()
                let navController = UINavigationController(rootViewController: viewController)
                window.rootViewController = navController
                self.window = window
                window.backgroundColor = .systemBackground
                window.makeKeyAndVisible()
            }
        }
}
