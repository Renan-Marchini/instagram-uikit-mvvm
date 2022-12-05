//
//  ViewCode.swift
//  instagram-uikit-mvvm
//
//  Created by Renan Andrusiac on 28/11/22.
//

import Foundation

// MARK: - ViewCodeProtocol

protocol ViewCode {
    func buildHierarchy()
    func configViews()
    func setupConstrains()
}

// MARK: - Implementations

extension ViewCode {
    func setupUI() {
        configViews()
        buildHierarchy()
        setupConstrains()
    }
}
