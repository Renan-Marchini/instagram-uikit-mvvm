//
//  ImageSelectorController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 29/11/22.
//

import UIKit

// MARK: - ImageSelectorController

class ImageSelectorController: UIViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension ImageSelectorController: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        view.backgroundColor = .systemPurple
    }

    func setupConstrains() {
        
    }
}
