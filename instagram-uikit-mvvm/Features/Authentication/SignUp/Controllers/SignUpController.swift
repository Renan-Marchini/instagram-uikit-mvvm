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
        static let secondColorBackground = UIColor.systemBlue.cgColor
    }
    
    private enum Dimension {
        static let pushImageButtonSize = 80.0
        static let pushImageButtonSpacing = 32.0
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

extension SignUpController: ViewCode {
    func buildHierarchy() {
        view.addSubview(mainStackView)
    }
    
    func configViews() {
        gradientBackground(
            firstColor: Color.firstColorBackground,
            secondColor: Color.secondColorBackground
        )
        mainStackView.backgroundColor = .systemOrange
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

extension SignUpController {
    private func buildStackView() -> UIStackView {
        let sk = UIStackView()
        sk.axis = .vertical
        sk.spacing = Dimension.stackViewSpacing
        return sk
    }
}
