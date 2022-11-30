//
//  FeedCell.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 29/11/22.
//

import SnapKit
import UIKit

// MARK: - FeedCell

class FeedCell: UICollectionViewCell {

    // MARK: - Dimensions

    private enum Dimension {
        static let profileImageSize = 40.0
        static let profileImageOffiset = 12
    }

    // MARK: - Properties

    private lazy var profileImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "iron-profile")
        return iv
    }()

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
        addSubview(profileImage)
    }

    func configViews() {
        backgroundColor = .systemCyan

        profileImage.layer.cornerRadius = Dimension.profileImageSize / 2
    }
    
    func setupConstrains() {
        profileImage.snp.makeConstraints { make in
            make.top
                .left
                .equalToSuperview()
                .offset(Dimension.profileImageOffiset)
            make.height
                .width
                .equalTo(Dimension.profileImageSize)
        }
    }
}
