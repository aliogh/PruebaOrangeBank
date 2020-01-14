//
//  HomeNavigator.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit
import Domain

protocol HomeNavigatorProtocol {
    func toSplash()
    func toHome()
}

class HomeNavigator: BaseNavigator, HomeNavigatorProtocol {

    func toSplash() {
        super.showRoot(name: String(describing: SplashViewController.self))
        if var view = vc as? SplashViewController {
            view.bind(to: DependencyInjector.shared.getSplashViewModel(navigator: self))
        }
    }

    func toHome() {
        super.showRoot(name: String(describing: HomeViewController.self))
        if var view = vc as? HomeViewController {
            view.bind(to: DependencyInjector.shared.getHomeViewModel(navigator: self))
        }
    }

}
