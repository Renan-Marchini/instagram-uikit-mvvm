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
    private lazy var forgotPasswordButton = buildSystemBoldButton(
        systemTitle: "Forgot your password? ",
        boldTitle: "Get help signing in.",
        action: #selector(forgotPasswordButtonTapped)
    )
    private lazy var mainStackView = buildStackView()
    private lazy var loginButton = buildMainButton(
        title: "Log in",
        action: #selector(loginButtonTapped)
    )
    private lazy var logoImageView = UIImageView(image: UIImage(named: "instagram_logo"))
    private lazy var passwordTextField = buildTextField(
        placeholder: "Password",
        isSecureTextEntry: true
    )
    private lazy var signUpButton = buildSystemBoldButton(
        systemTitle: "Don't have an account? ",
        boldTitle: "Sign Up.",
        action: #selector(showSignUpButtonTapped)
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

        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    func buildHierarchy() {
        view.addSubview(mainStackView)
        view.addSubview(signUpButton)

        mainStackView.addArrangedSubview(logoImageView)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(loginButton)
        mainStackView.addArrangedSubview(forgotPasswordButton)
    }

    func setupConstrains() {
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(Dimension.logoImageViewHeight)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
            make.bottom
                .lessThanOrEqualTo(signUpButton.snp.top)
        }
    }
}

// MARK: - Actions

extension LoginController {
    @objc private func loginButtonTapped() {
        // TODO: - implement handle
        print("DEBUG - loginButtonTapped <<<<<<<<<<<<<")
    }
    @objc private func forgotPasswordButtonTapped() {
        // TODO: - implement handle
        print("DEBUG - forgotPasswordButtonTapped <<<<<<<<<<<<<")
    }
    @objc private func showSignUpButtonTapped() {
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - Builders

extension LoginController {
    private func buildMainButton(
        title: String,
        action: Selector
    ) -> UIButton {
        let btn = PurpleButton()
        btn.addTarget(self, action: action, for: .touchUpInside)
        btn.setTitle(title, for: .normal)
        return btn
    }
    private func buildStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimension.stackViewSpacing
        return stackView
    }
    private func buildSystemBoldButton(
        systemTitle: String,
        boldTitle: String,
        action: Selector
    ) -> UIButton {
        let btn = UIButton(type: .system)
        btn.attributedSystemBoldTitle(
            systemTitle: systemTitle,
            boldTitle: boldTitle
        )
        btn.addTarget(self, action: action, for: .touchUpInside)
        return btn
    }
    private func buildTextField(
        placeholder: String,
        isSecureTextEntry: Bool = false,
        keyboard: UIKeyboardType = .default
    ) -> UITextField {
        let textField = WhiteTextField(placeholder: placeholder)
        textField.keyboardType = keyboard
        textField.isSecureTextEntry = isSecureTextEntry
        return textField
    }
}
