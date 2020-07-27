//
//  AmountTextView.swift
//  uiAssignment
//
//  Created by Kostya on 28/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

@IBDesignable
final class AmountTextView: UIView {
    
    @IBInspectable
    var amount: Int64 = 0 {
        didSet {
            viewModel = AmountTextModel(amount)
        }
    }
    @IBInspectable
    var fontSize: CGFloat = 16.0 {
        didSet {
            updateElements()
        }
    }
    
    private var viewModel = AmountTextModel(0) {
        didSet {
            updateElements()
        }
    }
    
    private let euroLabel = UILabel()
    private let centLabel = UILabel()
    
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
        euroLabel.text = viewModel.euroAmountStr
        centLabel.text = viewModel.centAmountStr
        euroLabel.textColor = viewModel.textColor
        centLabel.textColor = viewModel.textColor
        euroLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
        centLabel.font = UIFont.systemFont(ofSize: fontSize - 4)
    }
    
    private func setupElements() {
        translatesAutoresizingMaskIntoConstraints = false
        euroLabel.translatesAutoresizingMaskIntoConstraints = false
        euroLabel.font = euroLabel.font.bold()
        euroLabel.textAlignment = .right
        euroLabel.text = "\(AmountText.shared.useISOCode() ? "EUR" : "€") 0,"
        addSubview(euroLabel)
        NSLayoutConstraint.activate([
            euroLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            euroLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        centLabel.translatesAutoresizingMaskIntoConstraints = false
        centLabel.font = UIFont.systemFont(ofSize: fontSize - 4)
        centLabel.text = "00"
        addSubview(centLabel)
        NSLayoutConstraint.activate([
            centLabel.leadingAnchor.constraint(equalTo: euroLabel.trailingAnchor),
            centLabel.topAnchor.constraint(equalTo: centLabel.topAnchor),
            centLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        bottomAnchor.constraint(equalTo: euroLabel.bottomAnchor).isActive = true
    }
}
