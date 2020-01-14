//
//  Application.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit

final class Application {

    static let shared = Application()
    private var window: UIWindow!

    func configureMainInterface(in window: UIWindow) {

        self.window = window

        window.rootViewController = getNavigationController()

        HomeNavigator().toSplash()
    }

    func getNavigationController(rootVC: UIViewController? = nil) -> UINavigationController {

        if let rootVC = rootVC {
            return UINavigationController(rootViewController: rootVC)
        } else {
            let navigationController = window.rootViewController as? UINavigationController

            if let navigationController = navigationController {
                return navigationController
            } else {
                return UINavigationController()
            }
        }
    }

}

