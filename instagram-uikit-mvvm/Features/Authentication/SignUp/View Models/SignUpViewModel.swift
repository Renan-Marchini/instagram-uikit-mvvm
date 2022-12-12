//
//  SignUpViewModel.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 12/12/22.
//

import Foundation

struct SignUpViewModel {

    // MARK: - Properties

    var email: String?
    var password: String?
    var fullname: String?
    var username: String?

    var isFormValid: Bool {
        guard email?.isEmpty == false &&
                password?.isEmpty == false &&
                fullname?.isEmpty == false &&
                username?.isEmpty == false
        else { return false }
        return true
    }
}
