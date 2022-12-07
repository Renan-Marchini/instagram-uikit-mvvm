//
//  UIButtonExtensions.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 06/12/22.
//

import UIKit

// MARK: - Attributes

extension UIButton {
    private enum Color {
        static let attributedSystemBoldTitleColor = UIColor(white: 1.0, alpha: 0.87)
    }
    private enum Dimension {
        static let attributedSystemBoldTitleFontSize = 16.0
    }
}

// MARK: - Attributed System Bold Title

extension UIButton {
    func attributedSystemBoldTitle(
        systemTitle: String,
        boldTitle: String
    ) {
        let systemAtts: [NSAttributedString.Key: Any] = [
            .foregroundColor: Color.attributedSystemBoldTitleColor,
            .font: UIFont.systemFont(ofSize: Dimension.attributedSystemBoldTitleFontSize)
        ]
        let boldAtts: [NSAttributedString.Key: Any] = [
            .foregroundColor: Color.attributedSystemBoldTitleColor,
            .font: UIFont.boldSystemFont(ofSize: Dimension.attributedSystemBoldTitleFontSize)
        ]
        let attributedTitle = NSMutableAttributedString(
            string: systemTitle,
            attributes: systemAtts
        )
        attributedTitle.append(
            NSMutableAttributedString(
                string: boldTitle,
                attributes: boldAtts
            )
        )
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
