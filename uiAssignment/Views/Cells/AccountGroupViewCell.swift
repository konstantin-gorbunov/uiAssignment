//
//  AccountGroupViewCell.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class AccountGroupViewCell: UICollectionViewCell, NibInstantiatable {

    @IBOutlet private weak var borderedView: BorderedView? {
        didSet {
            borderedView?.borderColor = UIColor.darkGray.cgColor
        }
    }

    @IBOutlet private weak var accountStackView: UIStackView?
    @IBOutlet private weak var groupNameLabel: UILabel?
    @IBOutlet private weak var amountLabel: UILabel?

    var viewModel: AccountGroepViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            groupNameLabel?.text = viewModel.name
            amountLabel?.text = String(viewModel.totalAmount)
            borderedView?.borderSides = viewModel.borderSides
            
            accountStackView?.removeAllArrangedSubviews()
            viewModel.accountViewModels?.forEach {
                let accountView = AccountView()
                accountView.viewModel = $0
                accountStackView?.addArrangedSubview(accountView)
            }
        }
    }
}

extension UIStackView {
    @discardableResult
    func removeAllArrangedSubviews() -> [UIView] {
        return arrangedSubviews.reduce([UIView]()) { $0 + [removeArrangedSubViewProperly($1)] }
    }

    func removeArrangedSubViewProperly(_ view: UIView) -> UIView {
        removeArrangedSubview(view)
        NSLayoutConstraint.deactivate(view.constraints)
        view.removeFromSuperview()
        return view
    }
}
