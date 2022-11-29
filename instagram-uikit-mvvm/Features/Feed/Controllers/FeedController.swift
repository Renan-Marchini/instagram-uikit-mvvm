//
//  FeedController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 28/11/22.
//

import UIKit

// MARK: - FeedController

class FeedController: UICollectionViewController {

    // MARK: - Properties

    let reuseIdentifier = "Cell"

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UICollectionViewDataSource

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
}

// MARK: - View Code

extension FeedController: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    func setupConstrains() {
        
    }
}
