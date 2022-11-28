//
//  HomeTabBarController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 28/11/22.
//

import UIKit

// MARK: - HomeTabBarController

class HomeTabBarController: UITabBarController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

// MARK: - View Code

extension HomeTabBarController: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        view.backgroundColor = .white

        let feed = buildNavigationController(
            rootController: FeedController(),
            image: UIImage(named: "home_unselected"),
            selectedImage: UIImage(named: "home_selected")
        )

        viewControllers = [ feed ]

        tabBar.tintColor = .black
    }
    
    func setupConstrains() {
        
    }
}

// MARK: - Builders

extension HomeTabBarController {
    private func buildNavigationController(
        rootController: UIViewController,
        image: UIImage?,
        selectedImage: UIImage?
    ) -> UINavigationController {
        let nav = UINavigationController(
            rootViewController: rootController
        )
        nav.tabBarItem.image = image
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}
