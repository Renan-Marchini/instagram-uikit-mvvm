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
        static let profileImageOffset = 12.0
        static let usernameButtonFontSize = 13.0
        static let usernameButtonOffset = 8.0
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

    private lazy var usernameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Tony Stark", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: Dimension.usernameButtonFontSize)
        btn.addTarget(self, action: #selector(usernameTapped), for: .touchUpInside)
        return btn
    }()

    // MARK: - Life Time

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc private func usernameTapped() {
        print("DEBUG - usernameTapped <<<<<<<")
    }
}

// MARK: - View Code

extension FeedCell: ViewCode {
    func buildHierarchy() {
        addSubview(profileImage)
        addSubview(usernameButton)
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
        usernameButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImage)
            make.left
                .equalTo(profileImage.snp.right)
                .offset(Dimension.usernameButtonOffset)
        }
    }
}
