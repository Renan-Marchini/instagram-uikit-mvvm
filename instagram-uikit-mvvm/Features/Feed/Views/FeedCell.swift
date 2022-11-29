//
//  FeedCell.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 29/11/22.
//

import UIKit

// MARK: - FeedCell

class FeedCell: UICollectionViewCell {

    // MARK: - Life Time

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Code

extension FeedCell: ViewCode {
    func buildHierarchy() {
        
    }

    func configViews() {
        backgroundColor = .systemCyan
    }
    
    func setupConstrains() {
        
    }
}
