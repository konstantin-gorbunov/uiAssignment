//
//  BaseCollectionViewController.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {

     struct Constants {
        static let itemsInRow = 1
        static let lineSpacing: CGFloat = 0
        static let rowSpacing: CGFloat = 0
        static let headerHeight: CGFloat = 240

        static func cellWidth(in view: UIView) -> CGFloat {
            assert(itemsInRow >= 0)
            let availableWidth = view.bounds.width - (lineSpacing * CGFloat(itemsInRow - 1))
            return availableWidth / CGFloat(itemsInRow)
        }
    }
    
    var headerViewModel: HeaderViewModel?

    var flowLayout: UICollectionViewFlowLayout? {
        return collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    }

    func configureCell(_ cell: AccountGroupViewCell, at indexPath: IndexPath) {
        /* Call in subclass to configure Cell */
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        flowLayout?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout?.minimumLineSpacing = Constants.lineSpacing
        flowLayout?.minimumInteritemSpacing = Constants.rowSpacing
        flowLayout?.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: Constants.headerHeight)

        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .white
        collectionView?.registerForCell(AccountGroupViewCell.self)
        collectionView?.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseIdentifier)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fatalError("Should be overriden in subclass")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AccountGroupViewCell = collectionView.dequeueCell(at: indexPath)
        configureCell(cell, at: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath)
            if let headerView = headerView as? HeaderView {
                headerView.viewModel = headerViewModel
            }
            return headerView
        case UICollectionView.elementKindSectionFooter:
            assert(false, "Unexpected element kind")
        default:
            assert(false, "Unexpected element kind")
        }
    }
}
