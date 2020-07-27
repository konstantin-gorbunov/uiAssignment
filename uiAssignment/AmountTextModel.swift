//
//  AmountTextModel.swift
//  uiAssignment
//
//  Created by Kostya on 27/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

struct AmountTextModel {

    let totalAmount: Int64
    let euroAmount: Int64
    let euroAmountStr: String
    let centAmount: Int8
    let centAmountStr: String
    let textColor: UIColor
    
    init(_ totalAmount: Int64) {
        self.totalAmount = totalAmount
        euroAmount = totalAmount/100
        let reversedString = String(String(abs(euroAmount)).reversed())
        let separatedEuroAmountString = String(reversedString.separate(every: 3, with: ".").reversed())
        euroAmountStr = "\(totalAmount < 0 ? "-" : "")\(AmountText.shared.useISOCode() ? "EUR" : "€") \(separatedEuroAmountString),"
        centAmount = Int8(abs(totalAmount) % 100)
        centAmountStr = centAmount == 0 ? "00" : centAmount > 10 ? String(centAmount) : "0\(centAmount)"
        textColor = totalAmount < 0 ? .red : .darkGray
    }
}

extension String {

    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
}
