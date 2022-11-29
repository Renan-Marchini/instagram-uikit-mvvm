//
//  FeedController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 28/11/22.
//

import UIKit

// MARK: - FeedController

class FeedController: UICollectionViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension FeedController: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        collectionView.backgroundColor = .white
    }

    func setupConstrains() {
        
    }
}
