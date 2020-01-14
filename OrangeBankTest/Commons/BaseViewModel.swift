//
//  BaseViewModel.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import Domain
import RxSwift

protocol ViewState {}

protocol ViewModelType {}

//TODO : handle errors and loading

protocol ViewModelDelegate {
    func update(with state: ViewState)
}

class BaseViewModel: ViewModelType {
    var delegate: ViewModelDelegate?
    var disposeBag = DisposeBag()
    private let navigator: BaseNavigatorProtocol = BaseNavigator()
    init() {}

}
