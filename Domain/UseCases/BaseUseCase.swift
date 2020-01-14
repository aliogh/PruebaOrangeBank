//
//  BaseUseCase.swift
//  Domain
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import RxSwift

protocol BaseUseCaseProtocol {
    associatedtype T
    func handle() -> Observable<T>
}

public class BaseUseCase<T> {

    public init() {
    }

    public func execute() -> Observable<T> {

        return handle()
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }

    internal func handle() -> Observable<T> {
        return Observable<T>.empty()
    }

}
