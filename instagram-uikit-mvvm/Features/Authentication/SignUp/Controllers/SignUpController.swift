//
//  SignUpController.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 06/12/22.
//

import UIKit

// MARK: - SignUpController

class SignUpController: UIViewController {

    // MARK: - Attributes

    private enum Color {
        static let firstColorBackground = UIColor.systemPurple.cgColor
        static let imageButtonColor = UIColor.white
        static let secondColorBackground = UIColor.systemBlue.cgColor
    }

    private enum Dimension {
        static let pushImageButtonSize = 140.0
        static let pushImageButtonSpacing = 32.0
        static let stackViewSpacing = 20.0
        static let stackViewOffice = 32.0
    }

    // MARK: - Properties

    private lazy var emailTextField = buildTextField(
        placeholder: "E-mail",
        keyboard: .emailAddress
    )
    private lazy var fullnameTextField = buildTextField(
        placeholder: "Fullname"
    )
    private lazy var loginButton = buildSystemBoldButton(
        systemTitle: "Already have an account? ",
        boldTitle: "Log in.",
        action: #selector(showLoginButtonTapped)
    )
    private lazy var mainStackView = buildStackView()
    private lazy var passwordTextField = buildTextField(
        placeholder: "Password",
        isSecureTextEntry: true
    )
    private lazy var pushProfileImageButton = buildImageButton(
        with: #imageLiteral(resourceName: "upload_photo"),
        action: #selector(pushProfileImageButtonTapped)
    )
    private lazy var signUpButton = buildPurpleButton(
        title: "Sign Up",
        action: #selector(signUpButtonTapped)
    )
    private lazy var usernameTextField = buildTextField(
        placeholder: "Username"
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - View Code

extension SignUpController: ViewCode {
    func buildHierarchy() {
        view.addSubview(mainStackView)
        view.addSubview(loginButton)

        mainStackView.addArrangedSubview(pushProfileImageButton)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(fullnameTextField)
        mainStackView.addArrangedSubview(usernameTextField)
        mainStackView.addArrangedSubview(signUpButton)
    }

    func configViews() {
        gradientBackground(
            firstColor: Color.firstColorBackground,
            secondColor: Color.secondColorBackground
        )

        mainStackView.setCustomSpacing(
            Dimension.pushImageButtonSpacing,
            after: pushProfileImageButton
        )
    }

    func setupConstrains() {
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        pushProfileImageButton.snp.makeConstraints { make in
            make.height.equalTo(Dimension.pushImageButtonSize)
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

// MARK: - Button Handlers

extension SignUpController {
    @objc private func pushProfileImageButtonTapped() {
        print("DEBUG - pushProfileImageButton <<<<<<<<<<<")
    }
    @objc private func signUpButtonTapped() {
        print("DEBUG - signUpButtonTapped <<<<<<<<<<<<")
    }
    @objc private func showLoginButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Builders

extension SignUpController {
    private func buildImageButton(
        with image: UIImage,
        action: Selector
    ) -> UIButton {
        let btn = UIButton(type: .system)
        btn.addTarget(self, action: action, for: .touchUpInside)
        btn.setImage(image, for: .normal)
        btn.tintColor = Color.imageButtonColor
        btn.contentMode = .scaleAspectFill
        return btn
    }
    private func buildPurpleButton(
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
