//
//  BindableType.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit

/**
 Each view controller conforming to the BindableType protocol
 will declare a viewModel variable and provide a bindViewModel() function
 to be called once the viewModel variable is assigned.
 This function will connect UI elements to observables and actions in the view model.
 */

protocol BindableType {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }
    func setupUI()
}

extension BindableType where Self: UIViewController {

    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        setupUI()
    }

}

extension BindableType where Self: UIView {

    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        setupUI()
    }

}

extension BindableType where Self: UITableViewCell {

    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        setupUI()
    }


}
