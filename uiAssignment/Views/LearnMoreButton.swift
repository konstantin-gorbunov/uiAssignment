//
//  LearnMoreButton.swift
//  uiAssignment
//
//  Created by Kostya on 27/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class LearnMoreButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        layer.masksToBounds = true
        backgroundColor = .lightGray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
