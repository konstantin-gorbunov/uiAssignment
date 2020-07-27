//
//  Account.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import Foundation

struct Account: Decodable {
    
    let groupId: Int64
    let groupName: String
    let name: String
    let iban: String
    let amount: Int64
        
    enum CodingKeys: String, CodingKey {
        case groupId = "\"Account group id\""
        case groupName = "\"Account group name\""
        case name = "\"Account name\""
        case iban = "\"IBAN\""
        case amount = "\"Amount\""
    }
}
