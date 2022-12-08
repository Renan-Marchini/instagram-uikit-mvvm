//
//  ProfileController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 29/11/22.
//

import UIKit

// MARK: - ProfileController

class ProfileController: UIViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension ProfileController: ViewCode {
    func buildHierarchy() {

    }

    func configViews() {
        view.backgroundColor = .systemOrange
    }

    func setupConstrains() {

    }
}
