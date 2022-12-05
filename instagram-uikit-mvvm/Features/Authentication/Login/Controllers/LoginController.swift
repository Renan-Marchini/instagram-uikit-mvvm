//
//  LoginController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 05/12/22.
//

import UIKit

// MARK: - LoginController

class LoginController: UIViewController {

    // MARK: - Enums

    private enum Color {
        static let firstColorBackground = UIColor.systemPurple.cgColor
        static let secondColorBackground = UIColor.systemBlue.cgColor
    }

    private enum Dimension {
        static let stackViewSpacing = 20.0
        static let stackViewOffice = 32.0
    }

    // MARK: - Properties

    private lazy var mainStackView = buildStackView()

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
        view.addSubview(mainStackView)
    }
    
    func setupConstrains() {
        mainStackView.snp.makeConstraints { make in
            make.top
                .equalTo(view.safeAreaLayoutGuide.snp.top)
                .offset(Dimension.stackViewOffice)
            make.left
                .equalToSuperview()
                .offset(Dimension.stackViewOffice)
            make.right
                .equalToSuperview()
                .offset(-Dimension.stackViewOffice)
            
        }
    }
}

// MARK: - Builders

extension LoginController {
    private func buildStackView() -> UIStackView {
        let sk = UIStackView()
        sk.axis = .vertical
        sk.spacing = Dimension.stackViewSpacing
        return sk
    }
}
