//
//  AccountsCollectionViewController.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

protocol AccountCollectionViewDelegate: class {
    func didSelectAccountGroup(_ accountGroup: [Account])
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func configureCell(_ cell: AccountGroupViewCell, at indexPath: IndexPath) {
        let groupID = viewModel.accountsGroupsId[indexPath.row]
        let accountGroup = viewModel.accountGroups[groupID]
        cell.viewModel = AccountGroepViewModel(
            accountGroup,
            borderSides: BorderLayer.Side.border(at: indexPath)
        )
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.accountGroups.count
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let groupID = viewModel.accountsGroupsId[indexPath.row]
        guard let accountGroup = viewModel.accountGroups[groupID] else { return }
        delegate?.didSelectAccountGroup(accountGroup)
    }
}

extension AccountsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cellWidth(in: self.view), height: flowLayout?.itemSize.height ?? 0)
    }
}
