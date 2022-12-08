//
//  SearchController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 29/11/22.
//

import UIKit

// MARK: - SearchController

class SearchController: UIViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension SearchController: ViewCode {
    func buildHierarchy() {

    }

    func configViews() {
        view.backgroundColor = .systemMint
    }

    func setupConstrains() {

    }
}
