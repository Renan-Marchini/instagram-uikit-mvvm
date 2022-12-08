//
//  SceneDelegate.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 28/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        /// 1. Capture WindowScene and create a UIWindow
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        /// 2. Create view hierarchy programmatically
        let rootViewController = LoginController()
        let navigationController = UINavigationController(rootViewController: rootViewController)

        /// 3. Set the window and call makeKeyAndVisible
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        /// 4. Persist window in global variable
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

}
