//
//  NotificationsController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 29/11/22.
//

import UIKit

// MARK: - NotificationsController

class NotificationsController: UIViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension NotificationsController: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        view.backgroundColor = .systemPink
    }

    func setupConstrains() {
        
    }
}
