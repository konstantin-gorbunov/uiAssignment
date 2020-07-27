//
//  HeaderView.swift
//  uiAssignment
//
//  Created by Kostya on 27/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "HeaderViewIdentifier"
    
    var viewModel: HeaderViewModel? {
        didSet {
            totalBalance.text = String(viewModel?.totalAmount ?? 0)
        }
    }
    
    private enum Constants {
        static let totalBalanceText = "Total Balance"
        static let advText = "Enjoy free withdrawals\nfrom everywhere in the world."
        static let learnMoreText = "Learn more".uppercased()
        static let textLeading: CGFloat = 10.0
        static let textTrailing: CGFloat = -20.0
        static let textTop: CGFloat = 20.0
        static let closeSize = CGSize(width: 20, height: 20)
        static let closeTop: CGFloat = 20.0
        static let closeTrailing: CGFloat = -20.0
        static let imageHeight: CGFloat = 150.0
        static let gearSize = CGSize(width: 24, height: 24)
        static let gearTop: CGFloat = 15.0
        static let gearTrailing: CGFloat = -20.0
        static let learnMoreWidth: CGFloat = 150.0
        static let learnMoreLeading: CGFloat = 10.0
        static let learnMoreTrailing: CGFloat = -10.0
        static let totalBalanceTop: CGFloat = 35.0
        static let balanceTop: CGFloat = 3.0
    }
    
    private let gearButton = UIButton.init(type: .custom)
    private let imageView = UIImageView()
    private let closeButton = UIButton.init(type: .custom)
    private let textLabel = UILabel()
    private let learnMoreButton = LearnMoreButton()
    private let totalBalanceLabel = UILabel()
    private let totalBalance = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }

    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private
    
    private func setupElements() {
        gearButton.translatesAutoresizingMaskIntoConstraints = false
        if let imageNormal = UIImage(named: "gearicon") {
            gearButton.setImage(imageNormal, for: .normal)
        }
        addSubview(gearButton)
        NSLayoutConstraint.activate([
            gearButton.widthAnchor.constraint(equalToConstant: Constants.gearSize.width),
            gearButton.heightAnchor.constraint(equalToConstant: Constants.gearSize.height),
            gearButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.gearTop),
            gearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.gearTrailing),
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        if let imageNormal = UIImage(named: "closeicon") {
            closeButton.setImage(imageNormal, for: .normal)
        }
        addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: Constants.closeSize.width),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.closeSize.height),
            closeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: Constants.closeTop),
            closeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Constants.closeTrailing),
        ])
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 0
        textLabel.textColor = .lightGray
        textLabel.font = textLabel.font.bold()
        textLabel.text = Constants.advText
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: Constants.textLeading),
            textLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: Constants.textTrailing),
            textLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: Constants.textTop),
        ])
        
        learnMoreButton.setTitle(Constants.learnMoreText, for: .normal)
        addSubview(learnMoreButton)
        NSLayoutConstraint.activate([
            learnMoreButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: Constants.learnMoreLeading),
            learnMoreButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.learnMoreTrailing),
            learnMoreButton.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.learnMoreWidth),
        ])
        
        totalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalBalanceLabel.text = Constants.totalBalanceText
        addSubview(totalBalanceLabel)
        NSLayoutConstraint.activate([
            totalBalanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalBalanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.totalBalanceTop),
        ])
        
        totalBalance.translatesAutoresizingMaskIntoConstraints = false
        addSubview(totalBalance)
        NSLayoutConstraint.activate([
            totalBalance.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalBalance.topAnchor.constraint(equalTo: totalBalanceLabel.bottomAnchor, constant: Constants.balanceTop),
        ])
    }
}
