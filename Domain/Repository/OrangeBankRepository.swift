//
//  OrangeBankRepository.swift
//  Domain
//
//  Created by ali.ghanbari.local on 13/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import Foundation
import RxSwift

public protocol OrangeBankRepository{
    func getTransactions() -> Observable<TransactionsDomainModel>
}
