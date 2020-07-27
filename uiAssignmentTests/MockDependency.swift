//
//  MockDependency.swift
//  uiAssignment
//
//  Created by Kostiantyn Gorbunov on 25/10/2019.
//  Copyright © 2019 Kostiantyn Gorbunov. All rights reserved.
//

import CoreData
@testable import uiAssignment

class MockDataProvider: DataProvider {

    var onFetch: ((DataProvider.FetchAccountCompletion) -> Void)?

    func fetchAccountList(_ completion: @escaping DataProvider.FetchAccountCompletion) {
        onFetch?(completion)
    }
}

class MockDependency: Dependency {
    
    let dataProvider: DataProvider = MockDataProvider()
}

extension Account {
    static func mockAccount(accountGroupId: Int64 = 100, accountGroupName: String = "Current Accounts", accountName: String = "Current Account", iban: String = "NL25 TRIO 0253 8443 20", amount: Int64 = 150000) -> Account? {
        let data = """
        "Account group id","Account group name","Account name","IBAN","Amount"
        "\(accountGroupId)","\(accountGroupName)",\(accountName),"\(iban)","\(amount)"
        """
        let decoder = CSVDecoder()
        do {
            let realAccount = try decoder.decode(Account.self, from: data)
            return realAccount
        }
        catch {
            return nil
        }
    }
}
