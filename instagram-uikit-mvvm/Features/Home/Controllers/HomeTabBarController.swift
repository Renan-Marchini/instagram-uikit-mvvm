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
        let feed = buildNavigationController(
            rootController: FeedController(),
            image: UIImage(named: "home_unselected"),
            selectedImage: UIImage(named: "home_selected")
        )
        let search = buildNavigationController(
            rootController: SearchController(),
            image: UIImage(named: "search_unselected"),
            selectedImage: UIImage(named: "search_selected")
        )
        let imageSelector = buildNavigationController(
            rootController: ImageSelectorController(),
            image: UIImage(named: "plus_unselected"),
            selectedImage: UIImage(named: "plus_unselected")
        )
        let notifications = buildNavigationController(
            rootController: NotificationsController(),
            image: UIImage(named: "like_unselected"),
            selectedImage: UIImage(named: "like_selected")
        )
        let profile = buildNavigationController(
            rootController: ProfileController(),
            image: UIImage(named: "profile_unselected"),
            selectedImage: UIImage(named: "profile_selected")
        )

        viewControllers = [
            feed,
            search ,
            imageSelector,
            notifications,
            profile
        ]

        tabBar.backgroundColor = .white
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
