//
//  SplashViewController.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController, BindableType {

    // MARK: - Variables

    var viewModel: SplashViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    // MARK: - Lyfecycle

    override func viewWillAppear(_ animated: Bool) {
//        UIApplication.shared.applicationIconBadgeNumber = 0
        super.viewWillAppear(animated)

        setNavigationBarVisivility(isHidden: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.onDidAppear()
    }

    // MARK: - ViewModelDelegate

    override func update(with state: ViewState) {

        guard let _ = state as? SplashViewState else { return }

    }

    // MARK: - BindableType

    func setupUI() {
        self.update(with: SplashViewState())
    }

}
