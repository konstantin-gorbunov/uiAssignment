//
//  AccountViewModel.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

struct AccountViewModel {
    let name: String
    let borderSides: BorderLayer.Side
    
    init(_ account: Account, borderSides: BorderLayer.Side) {
        let nameFormat = NSLocalizedString("%@\n%@", comment: "Account representation")
        name = String.localizedStringWithFormat(nameFormat, account.name, account.iban)
        self.borderSides = borderSides
    }
}
