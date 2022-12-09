//
//  LoginViewModel.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 09/12/22.
//

import Foundation

// MARK: - LoginViewModel

struct LoginViewModel {

    // MARK: - Properties

    var email: String?
    var password: String?

    var isFormValid: Bool {
        guard email?.isEmpty == false && password?.isEmpty == false else { return false }
        return true
    }
}
