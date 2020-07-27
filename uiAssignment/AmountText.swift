//
//  AmountText.swift
//  uiAssignment
//
//  Created by Kostya on 27/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import Foundation

struct AmountTextConfig {
    let useISOCode: Bool
}

final class AmountText {
    
    static var shared: AmountText {
        if let initializedShared = _shared {
            return initializedShared
        }
        fatalError("Singleton not yet initialized. Run setup(withConfig:) first")
    }
    private static var _shared: AmountText?
    private var config: AmountTextConfig
    
    class func setup(withConfig config: AmountTextConfig) {
        _shared = AmountText(withConfig: config)
    }
    
    private init(withConfig config: AmountTextConfig) {
        self.config = config
    }
    
    func useISOCode() -> Bool {
        return config.useISOCode
    }
    
}
