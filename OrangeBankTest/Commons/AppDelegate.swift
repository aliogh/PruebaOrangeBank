//
//  AppDelegate.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        Application.shared.configureMainInterface(in: window)

        self.window = window
        return true
    }

}

