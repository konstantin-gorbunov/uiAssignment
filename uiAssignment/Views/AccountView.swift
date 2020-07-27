//
//  AccountView.swift
//  uiAssignment
//
//  Created by Kostya on 27/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class AccountView: UIView {
    @IBOutlet private weak var accountImageView: UIImageView?
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var ibanLabel: UILabel?
    @IBOutlet private weak var amountLabel: UILabel?
    
    var viewModel: AccountViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            nameLabel?.text = viewModel.name
            ibanLabel?.text = viewModel.iban
            amountLabel?.text = String(viewModel.amount)
        }
    }
}
