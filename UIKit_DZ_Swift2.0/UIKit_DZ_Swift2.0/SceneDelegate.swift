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
    
    let defaults = UserDefaults.standard
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = (scene as? UIWindowScene) else { return }
            guard let asd = defaults.string(forKey: "userName") else { return }
            
            let window = UIWindow(windowScene: windowScene)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if asd == asd {
                if let profileVC = storyboard.instantiateViewController(withIdentifier:
                                                                        "firstVC") as? ProfileViewController {
                    window.rootViewController = profileVC
                    self.window = window
                    window.makeKeyAndVisible()
                }
            } else {
                if let registrationVC = storyboard.instantiateViewController(withIdentifier: "registerVC")
                    as? RegistrationViewController {
                    window.rootViewController = registrationVC
                    self.window = window
                    window.makeKeyAndVisible()
                }
            }
    }
}
