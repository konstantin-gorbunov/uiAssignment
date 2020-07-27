//
//  HomeCoordinatorTests.swift
//  uiAssignment
//
//  Created by Kostiantyn Gorbunov on 25/10/2019.
//  Copyright © 2019 Kostiantyn Gorbunov. All rights reserved.
//

import XCTest
@testable import uiAssignment

class HomeCoordinatorTests: XCTestCase {

    var dependency: MockDependency?
    var coordinator: HomeCoordinator<MockDependency>?

    override func setUp() {
        super.setUp()
        
        let localDependency = MockDependency()
        dependency = localDependency
        coordinator = HomeCoordinator(
            dependency: localDependency
        )
    }

    override func tearDown() {
        coordinator = nil
        dependency = nil
        super.tearDown()
    }

    func testInit() {
        XCTAssertNotNil(dependency)
        XCTAssertNotNil(coordinator)
    }

    func testLoadingScreen() {
        let expectation = self.expectation(description: "Data Fetched")
        guard let account = Account.mockAccount() else {
            XCTFail("Can't create mock account")
            return
        }
        if let mock = (dependency?.dataProvider as? MockDataProvider) {
            mock.onFetch = { completion in
                completion(.success([account]))
                DispatchQueue.main.async {
                    expectation.fulfill()
                }
            }
        }
        coordinator?.start()
        let firstVisible = coordinator?.navigationViewController.visibleViewController
        XCTAssertTrue(firstVisible is LoadingViewController)
        wait(for: [expectation], timeout: 2)
        let secondVisible = coordinator?.navigationViewController.visibleViewController
        XCTAssertTrue(secondVisible is AccountsCollectionViewController)
    }

    func testErrorScreen() {
        let expectation = self.expectation(description: "Data Fetched")
        if let mock = (dependency?.dataProvider as? MockDataProvider) {
            mock.onFetch = { completion in
                completion(.success([]))
                DispatchQueue.main.async {
                    expectation.fulfill()
                }
            }
        }
        coordinator?.start()
        let firstVisible = coordinator?.navigationViewController.visibleViewController
        XCTAssertTrue(firstVisible is LoadingViewController)
        wait(for: [expectation], timeout: 2)
        let secondVisible = coordinator?.navigationViewController.visibleViewController
        XCTAssertTrue(secondVisible is ErrorViewController)
    }
}
