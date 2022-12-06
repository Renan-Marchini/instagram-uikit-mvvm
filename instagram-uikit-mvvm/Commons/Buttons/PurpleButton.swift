//
//  PurpleButton.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 06/12/22.
//

import UIKit

// MARK: - PurpleButton

class PurpleButton: UIButton {

    // MARK: - Attributes

    private enum Color {
        static let passwordButtonBackground = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        static let passwordButtonFont = UIColor.white
    }

    private enum Dimension {
        static let passwordButtonHeight = 50.0
        static let passwordButtonCornerRadius = 5.0
        static let passwordButtonFont = 20.0
    }

    // MARK: - Life Time

    init() {
        super.init(frame: .zero)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Code

extension PurpleButton: ViewCode {
    func buildHierarchy() {}
    
    func configViews() {
        backgroundColor = Color.passwordButtonBackground
        layer.cornerRadius = Dimension.passwordButtonCornerRadius
        setTitleColor(Color.passwordButtonFont, for: .normal)
        titleLabel?.font = UIFont
            .boldSystemFont(ofSize: Dimension.passwordButtonFont)
    }
    
    func setupConstrains() {
        self.snp.makeConstraints { make in
            make.height.equalTo(Dimension.passwordButtonHeight)
        }
    }
}
