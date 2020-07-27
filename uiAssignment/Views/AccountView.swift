//
//  AccountView.swift
//  uiAssignment
//
//  Created by Kostya on 27/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class AccountView: UIView {
    
    private enum Constants {
        static let accountImage = UIImage(named: "first")
        static let imageLeading: CGFloat = 3.0
        static let titleLeading: CGFloat = 8.0
        static let titleStackViewSpacing: CGFloat = 2.0
        static let amountTrailing: CGFloat = -8.0
        static let imageSize = CGSize(width: 40, height: 40)
        static let viewHeight: CGFloat = 55.0
    }
    
    private let accountImageView = UIImageView(image: Constants.accountImage)
    private let nameLabel = UILabel()
    private let ibanLabel = UILabel()
    private let amountLabel = AmountTextView()
    private let separator = UIView()
    
    var viewModel: AccountViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            nameLabel.text = viewModel.name
            ibanLabel.text = viewModel.iban
            separator.isHidden = viewModel.separator ? false : true
            amountLabel.amount = viewModel.amount
        }
    }
    
    convenience init(_ viewModel: AccountViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: Constants.viewHeight).isActive = true
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private
    
    private func setupElements() {
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .darkGray
        addSubview(separator)
        separator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        separator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.87).isActive = true
        separator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        separator.isHidden = true

        accountImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(accountImageView)
        accountImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.imageLeading).isActive = true
        accountImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        accountImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width).isActive = true
        accountImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height).isActive = true
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(amountLabel)
        amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.amountTrailing).isActive = true
        amountLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
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
        titleStackView.leadingAnchor.constraint(equalTo: accountImageView.trailingAnchor, constant: Constants.titleLeading).isActive = true
    }
}

extension UIFont {
    func bold() -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits.traitBold) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}
