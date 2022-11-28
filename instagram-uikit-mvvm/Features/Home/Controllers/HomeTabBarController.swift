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
        
    }


}

// MARK: - View Code

extension HomeTabBarController: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        view.backgroundColor = .white

        let feed = FeedController()

        viewControllers = [ feed ]
    }
    
    func setupConstrains() {
        
    }
}
