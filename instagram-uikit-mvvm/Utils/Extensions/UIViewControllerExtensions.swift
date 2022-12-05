//
//  UIViewControllerExtensions.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 05/12/22.
//

import UIKit

// MARK: - Gradient Background

extension UIViewController {
    func gradientBackground(
        firstColor: CGColor,
        secondColor: CGColor
    ) {
        let gradient = CAGradientLayer()
        gradient.colors = [
            firstColor,
            secondColor
        ]
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
    }
}
