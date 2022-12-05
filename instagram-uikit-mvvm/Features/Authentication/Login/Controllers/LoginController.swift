//
//  LoginController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 05/12/22.
//

import UIKit

// MARK: - LoginController

class LoginController: UIViewController {

    // MARK: - Color

    private enum Color {
        static let firstColorBackground = UIColor.systemPurple.cgColor
        static let secondColorBackground = UIColor.systemBlue.cgColor
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension LoginController: ViewCode {
    func configViews() {
        gradientBackground(
            firstColor: Color.firstColorBackground,
            secondColor: Color.secondColorBackground
        )
    }
    func buildHierarchy() {
        
    }
    
    func setupConstrains() {
        
    }
}
