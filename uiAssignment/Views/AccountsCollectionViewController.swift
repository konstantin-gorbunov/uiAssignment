//
//  AccountsCollectionViewController.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

protocol AccountCollectionViewDelegate: class {
    func didSelectAccount(_ account: Account)
}

class AccountsCollectionViewController: BaseCollectionViewController {

    private let viewModel: AccountListViewModel
    weak var delegate: AccountCollectionViewDelegate?

    init(viewModel: AccountListViewModel, layout: UICollectionViewLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func configureCell(_ cell: AccountViewCell, at indexPath: IndexPath) {
        let account = viewModel.accounts[indexPath.row]
        cell.viewModel = AccountViewModel(
            account,
            borderSides: BorderLayer.Side.border(at: indexPath)
        )
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.accounts.count
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectAccount(viewModel.accounts[indexPath.row])
    }
}

