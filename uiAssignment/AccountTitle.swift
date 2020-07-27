//
//  AccountTitle.swift
//  uiAssignment
//
//  Created by Kostya on 28/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

@IBDesignable
final class AccountTitle: UIView {
    
    @IBInspectable
    var name: String = "" {
        didSet {
            updateElements()
        }
    }
    
    @IBInspectable
    var iban: String = "" {
        didSet {
            updateElements()
        }
    }
    
    private enum Constants {
        static let titleStackViewSpacing: CGFloat = 2.0
    }
    
    private let nameLabel = UILabel()
    private let ibanLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupElements()
    }
    
    // MARK: - private
    
    private func updateElements() {
        nameLabel.text = name
        ibanLabel.text = iban
    }
    
    private func setupElements() {
        translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = nameLabel.font.bold()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ibanLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleStackView = UIStackView.init(arrangedSubviews: [nameLabel, ibanLabel])
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.axis = .vertical
        titleStackView.distribution = .fillProportionally
        titleStackView.spacing = Constants.titleStackViewSpacing
        addSubview(titleStackView)
        titleStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        topAnchor.constraint(equalTo: titleStackView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: titleStackView.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: titleStackView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: titleStackView.trailingAnchor).isActive = true
    }
}
