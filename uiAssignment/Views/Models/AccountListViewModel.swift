//
//  AccountListViewModel.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import Foundation

struct AccountListViewModel {
    /// List of Accounts
    let accountsGroupsId: [Int64]
    let accountGroups: [Int64: [Account]]
    
    init(_ accounts: [Account]) {
        accountGroups = Dictionary(grouping: accounts, by: { $0.groupId })
        accountsGroupsId = Array(accountGroups.keys).sorted(by: { $0 < $1 })
    }
}

extension BorderLayer.Side {
    /// Return border sides for given index path
    /// This is related to account list view with given items per row
    static func border(at indexPath: IndexPath,
                       itemsInRow: Int = BaseCollectionViewController.Constants.itemsInRow) -> BorderLayer.Side {
        var result: BorderLayer.Side = [.bottom, .right]
        if indexPath.row < itemsInRow {
            result.insert(.top)
        }
        if indexPath.row % itemsInRow == 0 {
            result.insert([.left])
        }
        return result
    }
}

