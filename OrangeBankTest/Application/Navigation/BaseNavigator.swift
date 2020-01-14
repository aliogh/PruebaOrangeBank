//
//  BaseNavigator.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit

protocol BaseNavigatorProtocol {}

class BaseNavigator: BaseNavigatorProtocol {

    internal weak var vc: UIViewController!

    func setStoryboard(name: String) {
        let storyboard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        self.vc = storyboard.instantiateViewController(withIdentifier: name)
    }

    func showRoot(name: String) {
        setStoryboard(name: name)
        Application.shared.getNavigationController(rootVC: vc).pushRootViewController(animated: true)
    }

    func show(name: String) {
        setStoryboard(name: name)
        Application.shared.getNavigationController().pushViewController(vc, animated: true)
    }


}
