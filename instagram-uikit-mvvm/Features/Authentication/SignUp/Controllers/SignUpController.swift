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
        static let profilePhotoPickerButtonSize = 140.0
        static let profilePhotoPickerButtonSpacing = 32.0
        static let stackViewSpacing = 20.0
        static let stackViewOffice = 32.0
    }

    // MARK: - Properties

    private var viewModel = SignUpViewModel()

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
    private lazy var profilePhotoPickerButton = buildImageButton(
        with: #imageLiteral(resourceName: "upload_photo"),
        action: #selector(profilePhotoPickerButtonTapped)
    )
    private lazy var profilePhotoPickerView = UIView()
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
        setObservers()
    }
}

// MARK: - View Code

extension SignUpController: ViewCode {
    func buildHierarchy() {
        view.addSubview(mainStackView)
        view.addSubview(loginButton)

        mainStackView.addArrangedSubview(profilePhotoPickerView)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(fullnameTextField)
        mainStackView.addArrangedSubview(usernameTextField)
        mainStackView.addArrangedSubview(signUpButton)

        profilePhotoPickerView.addSubview(profilePhotoPickerButton)
    }

    func configViews() {
        gradientBackground(
            firstColor: Color.firstColorBackground,
            secondColor: Color.secondColorBackground
        )

        mainStackView.setCustomSpacing(
            Dimension.profilePhotoPickerButtonSpacing,
            after: profilePhotoPickerView
        )
    }

    func setupConstrains() {
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        profilePhotoPickerButton.snp.makeConstraints { make in
            make.width.equalTo(Dimension.profilePhotoPickerButtonSize)
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        profilePhotoPickerView.snp.makeConstraints { make in
            make.height.equalTo(Dimension.profilePhotoPickerButtonSize)
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

// MARK: - Obeservers

extension SignUpController {
    private func setObservers() {
        setTextFieldsObservers()
    }
    private func setTextFieldsObservers() {
        emailTextField.addTarget(
            self,
            action: #selector(textFielTextChanged),
            for: .editingChanged
        )
        fullnameTextField.addTarget(
            self,
            action: #selector(textFielTextChanged),
            for: .editingChanged
        )
        passwordTextField.addTarget(
            self,
            action: #selector(textFielTextChanged),
            for: .editingChanged
        )
        usernameTextField.addTarget(
            self,
            action: #selector(textFielTextChanged),
            for: .editingChanged
        )
    }
}

// MARK: - Buttons' Handlers

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
    @objc private func textFielTextChanged(sender: UITextField) {
        switch sender {
        case emailTextField:
            viewModel.email = sender.text
        case fullnameTextField:
            viewModel.fullname = sender.text
        case passwordTextField:
            viewModel.password = sender.text
        case usernameTextField:
            viewModel.username = sender.text
        default:
            fatalError("Fatal error - text field sender is not handled in login.")
        }
        signUpButton.isEnabled = viewModel.isFormValid
    }
}

// MARK: - Builders

extension SignUpController {
    private func buildImageButton(
        with image: UIImage,
        action: Selector
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.setImage(image, for: .normal)
        button.tintColor = Color.imageButtonColor
        button.contentMode = .scaleAspectFill
        return button
    }
    private func buildPurpleButton(
        title: String,
        action: Selector
    ) -> UIButton {
        let button = PurpleButton()
        button.isEnabled = viewModel.isFormValid

        button.addTarget(self, action: action, for: .touchUpInside)
        button.setTitle(title, for: .normal)
        return button
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
        let button = UIButton(type: .system)
        button.attributedSystemBoldTitle(
            systemTitle: systemTitle,
            boldTitle: boldTitle
        )
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
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
