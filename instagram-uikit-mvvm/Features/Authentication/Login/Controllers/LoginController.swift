//
//  LoginController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 05/12/22.
//

import UIKit

// MARK: - LoginController

class LoginController: UIViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension LoginController: ViewCode {
    func configViews() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemBlue.cgColor
        ]
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
    }
    func buildHierarchy() {
        
    }
    
    func setupConstrains() {
        
    }
}
