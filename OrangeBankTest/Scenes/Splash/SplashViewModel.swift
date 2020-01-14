//
//  SplashViewModel.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import Domain
import RxSwift

class SplashViewModel: BaseViewModel {

    private let navigator: HomeNavigatorProtocol

    init(navigator: HomeNavigatorProtocol) {
        self.navigator = navigator
    }

    func onDidAppear() {
        navigator.toHome()
    }

}
