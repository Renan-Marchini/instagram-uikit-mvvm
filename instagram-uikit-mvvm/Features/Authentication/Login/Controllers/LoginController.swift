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
        static let logoImageViewHeight = 80.0
        static let logoImageViewSpacing = 32.0
        static let stackViewSpacing = 20.0
        static let stackViewOffice = 32.0
    }

    // MARK: - Properties

    private lazy var emailTextField = buildTextField(
        placeholder: "E-mail",
        keyboard: .emailAddress
    )
    private lazy var logoImageView = UIImageView(image: UIImage(named: "instagram_logo"))
    private lazy var mainStackView = buildStackView()
    private lazy var passwordTextField = buildTextField(
        placeholder: "Password",
        isSecureTextEntry: true
    )

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

        logoImageView.contentMode = .scaleAspectFit

        mainStackView.setCustomSpacing(Dimension.logoImageViewSpacing, after: logoImageView)
    }
    func buildHierarchy() {
        view.addSubview(mainStackView)

        mainStackView.addArrangedSubview(logoImageView)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
    }
    
    func setupConstrains() {
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(Dimension.logoImageViewHeight)
        }
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
    private func buildTextField(
        placeholder: String,
        isSecureTextEntry: Bool = false,
        keyboard: UIKeyboardType = .default
    ) -> UITextField {
        let tf = WhiteTextField(placeholder: placeholder)
        tf.keyboardType = keyboard
        tf.isSecureTextEntry = isSecureTextEntry
        return tf
    }
}
