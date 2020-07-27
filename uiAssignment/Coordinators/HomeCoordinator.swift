//
//  HomeCoordinator.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

/// Home (Accounts List) Coordinator
class HomeCoordinator<T: Dependency>: Coordinator<T>, RootViewProvider {

    lazy var rootViewController: UIViewController = {
        return navigationViewController
    }()

    private(set) lazy var navigationViewController = UINavigationController()

    private let title = NSLocalizedString("Accounts", comment: "Accounts")

    override func start() {
        super.start()

        let loadingViewController = LoadingViewController(nibName: nil, bundle: nil)
        navigationViewController.viewControllers = [loadingViewController]
        navigationViewController.tabBarItem.image = UIImage(named: "first")
        loadingViewController.title = title

        dependency.dataProvider.fetchAccountList { result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.processResults(result)
            }
        }
    }

    private func processResults(_ result: DataProvider.FetchAccountResult) {
        guard case .success(let accounts) = result, accounts.isEmpty == false else {
            let errorViewController = ErrorViewController(nibName: nil, bundle: nil)
            errorViewController.title = title
            navigationViewController.viewControllers = [errorViewController]
            return
        }

        let accountsViewController = AccountsCollectionViewController(
            viewModel: AccountListViewModel(accounts),
            headerViewModel: HeaderViewModel(totalAmount: 375000),
            layout: UICollectionViewFlowLayout()
        )
        accountsViewController.title = title
        accountsViewController.delegate = self
        navigationViewController.viewControllers = [accountsViewController]
    }
}

extension HomeCoordinator: AccountCollectionViewDelegate {

    func didSelectAccountGroup(_ accountGroup: [Account]) {
        debugPrint("\(self) didSelectAccountGroup")
    }
}
