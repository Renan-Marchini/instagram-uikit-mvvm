//
//  WhiteTextField.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 05/12/22.
//

import UIKit

// MARK: - WhiteTextField

class WhiteTextField: UITextField {

    // MARK: - Attributes

    private enum Color {
        static let backgroundColor = UIColor(
            white: 1,
            alpha: 0.1
        )
        static let placeholderFontColor = UIColor(
            white: 1.0,
            alpha: 0.7
        )
        static let textFontColor = UIColor.white
    }

    private enum Dimension {
        static let height = 50.0
        static let leftSpace = 20.0
    }

    // MARK: - Properties

    private let attributedString: String
    private let leftSpacer = UIView()

    // MARK: - Life Time

    init(placeholder: String) {
        self.attributedString = placeholder

        super.init(frame: .zero)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Code

extension WhiteTextField: ViewCode {
    func buildHierarchy() {
    }

    func configViews() {
        attributedPlaceholder = NSAttributedString(
            string: attributedString,
            attributes: [
                .foregroundColor: Color.placeholderFontColor
            ]
        )
        backgroundColor = Color.backgroundColor
        borderStyle = .none
        keyboardAppearance = .dark
        leftView = leftSpacer
        leftViewMode = .always
        textColor = Color.textFontColor
    }

    func setupConstrains() {
        leftSpacer.snp.makeConstraints { make in
            make.width.equalTo(Dimension.leftSpace)
        }
        self.snp.makeConstraints { make in
            make.height.equalTo(Dimension.height)
        }
    }
}
