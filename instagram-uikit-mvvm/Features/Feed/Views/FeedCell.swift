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
        static let interactionStackHeight = 50.0
        static let interactionStackWidth = 120.0
        static let postImageOffset = 8.0
        static let profileImageSize = 40.0
        static let profileImageOffset = 12.0
        static let usernameButtonFontSize = 13.0
        static let usernameButtonOffset = 8.0
    }

    // MARK: - Properties

    private lazy var commentsButton = buildSystemButton(
        image: UIImage(named: "comment"),
        action: #selector(commentsTapped)
    )
    private lazy var interactionStackView = buildStackView()
    private lazy var likeButton = buildSystemButton(
        image: UIImage(named: "like_unselected"),
        action: #selector(likeTapped)
    )
    private lazy var postImageView = buildImageView(with: UIImage(named: "iron-post"))
    private lazy var profileImageView = buildImageView(with: UIImage(named: "iron-profile"))
//    private lazy var usernameButton = buildSystemButton(
//        title: "Tony Stark",
//        action: #selector(usernameTapped)
//    )
    private lazy var shareButton = buildSystemButton(
        image: UIImage(named: "share"),
        action: #selector(shareTapped)
    )
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
    
    @objc private func commentsTapped() {
        print("DEBUG - commentsTapped <<<<<<<")
    }
    
    @objc private func likeTapped() {
        print("DEBUG - likeTapped <<<<<<<")
    }
    
    @objc private func usernameTapped() {
        print("DEBUG - usernameTapped <<<<<<<")
    }
    
    @objc private func shareTapped() {
        print("DEBUG - shareTapped <<<<<<<")
    }
}

// MARK: - Builders

extension FeedCell {
    private func buildStackView() -> UIStackView {
        let stk = UIStackView(arrangedSubviews: [
            likeButton,
            commentsButton,
            shareButton
        ])
        stk.axis = .horizontal
        stk.distribution = .fillEqually
        return stk
    }
    private func buildSystemButton(
        title: String? = nil,
        image: UIImage? = nil,
        action: Selector
    ) -> UIButton {
        let btn = UIButton(type: .system)
        if let title = title {
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.titleLabel?.font = .boldSystemFont(ofSize: Dimension.usernameButtonFontSize)
        }
        if let image = image {
            btn.setImage(image, for: .normal)
            btn.tintColor = .black
        }
        btn.addTarget(self, action: action, for: .touchUpInside)
        return btn
    }

    private func buildImageView(with image: UIImage?) -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = image
        return iv
    }
}

// MARK: - View Code

extension FeedCell: ViewCode {
    func buildHierarchy() {
        addSubview(postImageView)
        addSubview(profileImageView)
        addSubview(usernameButton)
        addSubview(interactionStackView)
    }

    func configViews() {
        profileImageView.layer.cornerRadius = Dimension.profileImageSize / 2
    }
    
    func setupConstrains() {
        interactionStackView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom)
            make.left.equalToSuperview()
            make.width.equalTo(Dimension.interactionStackWidth)
            make.height.equalTo(Dimension.interactionStackHeight)
        }
        postImageView.snp.makeConstraints { make in
            make.top
                .equalTo(profileImageView.snp.bottom)
                .offset(Dimension.postImageOffset)
            make.width
                .centerX
                .equalToSuperview()
            make.height.equalTo(postImageView.snp.width)
        }
        profileImageView.snp.makeConstraints { make in
            make.top
                .left
                .equalToSuperview()
                .offset(Dimension.profileImageOffset)
            make.height
                .width
                .equalTo(Dimension.profileImageSize)
        }
        usernameButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.left
                .equalTo(profileImageView.snp.right)
                .offset(Dimension.usernameButtonOffset)
        }
    }
}
