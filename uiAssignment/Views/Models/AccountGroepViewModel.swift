//
//  AccountGroepViewModel.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

struct AccountGroepViewModel {
    let name: String?
    let totalAmount: Int64
    let borderSides: BorderLayer.Side
    let accounts: [Account]?
    let accountViewModels: [AccountViewModel]?
    
    init(_ accounts: [Account]?, borderSides: BorderLayer.Side) {
        self.accounts = accounts
        self.borderSides = borderSides
        name = accounts?[0].groupName
        totalAmount = accounts?.map { $0.amount }.reduce(.zero, +) ?? 0
        accountViewModels = accounts?.map { AccountViewModel(name: $0.name, iban: $0.iban, amount: $0.amount) }
    }
}
