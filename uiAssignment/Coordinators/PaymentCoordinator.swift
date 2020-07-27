//
//  PaymentCoordinator.swift
//  uiAssignment
//
//  Created by Kostya on 27/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

class PaymentCoordinator<T: Dependency>: Coordinator<T>, RootViewProvider {

    lazy var rootViewController: UIViewController = {
        return navigationViewController
    }()

    private(set) lazy var navigationViewController = UINavigationController()

    private let title = NSLocalizedString("Payment", comment: "Payment")

    override func start() {
        super.start()

        let loadingViewController = LoadingViewController(nibName: nil, bundle: nil)
        navigationViewController.viewControllers = [loadingViewController]
        navigationViewController.tabBarItem.image = UIImage(named: "second")
        loadingViewController.title = title
    }
}
