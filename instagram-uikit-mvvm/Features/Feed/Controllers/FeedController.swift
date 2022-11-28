//
//  FeedController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 28/11/22.
//

import UIKit

// MARK: - FeedController

class FeedController: UIViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }
}

// MARK: - View Code

extension FeedController: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        view.backgroundColor = .systemBlue
    }

    func setupConstrains() {
        
    }
}
