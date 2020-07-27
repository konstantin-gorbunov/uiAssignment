//
//  AccountViewCell.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class AccountViewCell: UICollectionViewCell, NibInstantiatable {

    @IBOutlet private weak var borderedView: BorderedView? {
        didSet {
            borderedView?.borderColor = UIColor.blue.cgColor
        }
    }

    @IBOutlet private weak var titleLabel: UILabel?

    var viewModel: AccountViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            titleLabel?.text = viewModel.name
            borderedView?.borderSides = viewModel.borderSides
        }
    }
}
