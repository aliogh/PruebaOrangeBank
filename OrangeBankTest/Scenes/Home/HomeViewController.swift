//
//  HomeViewController.swift
//  OrangeBankTest
//
//  Created by ali.ghanbari.local on 14/01/2020.
//  Copyright © 2020 ghanbari. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, BindableType {

    // MARK: - Variables

    var viewModel: HomeViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    var transactionList = [TransactionCellModel]()

    @IBOutlet weak var tableView: UITableView!
    //TODO: outlets for empty state

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onDidLoad()
    }

    // MARK: - ViewModelDelegate

    override func update(with state: ViewState) {
        super.update(with: state)
        if let state = state as? HomeViewState {
            transactionList = state.transactions.sorted(by: {
                $0.date.compare($1.date) == .orderedDescending
            })
            transactionList = transactionList.removingDuplicates(byKey: {$0.id})
            tableView.isHidden = state.transactions.isEmpty
            tableView.reloadData()
        }

    }

    func setupUI() {
        title = "Transacciones"
        tableView.isHidden = true
        tableView.allowsSelection = false

    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Views.CellSize.transactionCellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Views.Identifiers.transactioncellidentifier) as? TransactionCell else { return UITableViewCell() }

        let transaction = transactionList[indexPath.row]
        cell.bind(transaction)
        return cell
    }
}
