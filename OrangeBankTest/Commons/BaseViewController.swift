//
//  BaseViewController.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit
import RxSwift
import Domain

class BaseViewController: UIViewController, ViewModelDelegate {


    // ViewModelDelegate

    public func update(with state: ViewState) { }

    // MARK: Variables

    private var rootViewController: UIViewController {
        if let parent = parent as? UIPageViewController {
            return parent
        } else {
            return self
        }
    }

    private var viewModel = BaseViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        view.accessibilityIdentifier = self.restorationIdentifier

        // Show the bottom line of Navigation Bar by default
        setNavigationBarTranslucent(isTraslucent: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Show the Navigation Bar by default
        setNavigationBarVisivility(isHidden: false)
    }

    // MARK: Navigation Bar

    /// Use recommended in the viewDidLoad
    func setTitleStringNavBar(_ title: String?) {
        rootViewController.title = title
    }

    /// Use recommended in the viewDidLoad
    func setTitleImageNavBar(_ imageName: String) {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)

        rootViewController.navigationItem.titleView = titleView
    }

    /// Use always in the viewWillAppear
    func setNavigationBarVisivility(isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: false)
    }

    /// Use always in the viewWillAppear
    func setNavigationBarTranslucent(isTraslucent: Bool) {
        if isTraslucent {
            navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            navigationController?.navigationBar.shadowImage = nil
        }
    }

    private func setupNavBar() {
        var titleTextAttributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.foregroundColor: Constants.Color.white]
        if let font = UIFont(name: "HelveticaNeue-Bold", size: 16) {
            titleTextAttributes[NSAttributedString.Key.font] = font
        }
        navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        navigationController?.navigationBar.barTintColor = Constants.Color.orange
        navigationController?.navigationBar.isTranslucent = false

        let navigationItem = rootViewController.navigationItem
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItems = []
    }
}

