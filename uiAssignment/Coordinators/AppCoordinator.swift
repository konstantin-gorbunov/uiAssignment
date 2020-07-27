//
//  AppCoordinator.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import UIKit

/// Main App Coordinator
class AppCoordinator<T: Dependency>: Coordinator<T>, RootViewProvider {

    var rootViewController: UIViewController {
        return tabBarController
    }

    private let window = UIWindow(frame: UIScreen.main.bounds)
    private let tabBarController = UITabBarController()
    private let tabBarControllerDelegate = NotSelectableTabBarController()

    override func start() {
        let homeCoordinator = HomeCoordinator(dependency: dependency)
        add(childCoordinator: homeCoordinator)
        homeCoordinator.start()
        
        let paymentCoordinator = PaymentCoordinator(dependency: dependency)
        add(childCoordinator: paymentCoordinator)
        paymentCoordinator.start()
        
        let insightsCoordinator = InsightsCoordinator(dependency: dependency)
        add(childCoordinator: insightsCoordinator)
        insightsCoordinator.start()
        
        let cardsCoordinator = CardsCoordinator(dependency: dependency)
        add(childCoordinator: cardsCoordinator)
        cardsCoordinator.start()
        
        let moreCoordinator = MoreCoordinator(dependency: dependency)
        add(childCoordinator: moreCoordinator)
        moreCoordinator.start()

        tabBarController.viewControllers = [
            homeCoordinator.rootViewController,
            paymentCoordinator.rootViewController,
            insightsCoordinator.rootViewController,
            cardsCoordinator.rootViewController,
            moreCoordinator.rootViewController
        ]
        tabBarController.delegate = tabBarControllerDelegate
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
