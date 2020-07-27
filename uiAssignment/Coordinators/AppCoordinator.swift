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

    override func start() {
        let homeCoordinator = HomeCoordinator(dependency: dependency)
        add(childCoordinator: homeCoordinator)
        homeCoordinator.start()

        tabBarController.viewControllers = [
            homeCoordinator.rootViewController
        ]
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
