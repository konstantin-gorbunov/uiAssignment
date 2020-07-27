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
        static let cellHeight: CGFloat = 160

        static func cellWidth(in view: UIView) -> CGFloat {
            assert(itemsInRow >= 0)
            let availableWidth = view.bounds.width - (lineSpacing * CGFloat(itemsInRow - 1))
            return availableWidth / CGFloat(itemsInRow)
        }
    }

    var flowLayout: UICollectionViewFlowLayout? {
        return collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    }

    func configureCell(_ cell: AccountGroupViewCell, at indexPath: IndexPath) {
        /* Call in subclass to configure Cell */
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        flowLayout?.itemSize = CGSize(width: Constants.cellWidth(in: self.view) , height: Constants.cellHeight)
        flowLayout?.minimumLineSpacing = Constants.lineSpacing
        flowLayout?.minimumInteritemSpacing = Constants.rowSpacing

        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .lightGray
        collectionView?.register(AccountGroupViewCell.self)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fatalError("Should be overriden in subclass")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AccountGroupViewCell = collectionView.dequeue(at: indexPath)
        configureCell(cell, at: indexPath)
        return cell
    }
}
