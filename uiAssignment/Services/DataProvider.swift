//
//  DataProvider.swift
//  uiAssignment
//
//  Created by Kostya on 26/07/2020.
//  Copyright © 2020 Kostiantyn Gorbunov. All rights reserved.
//

import Foundation

enum DataProviderError: Error {
    case resourceNotFound
    case parsingFailure(inner: Error)
}

protocol DataProvider {
    typealias FetchAccountResult = Result<[Account], Error>
    typealias FetchAccountCompletion = (FetchAccountResult) -> Void

    func fetchAccountList(_ completion: @escaping FetchAccountCompletion)
}

struct LocalAccountDataProvider: DataProvider {

    private let queue = DispatchQueue(label: "LocalAccountDataProviderQueue")

    // Completion block will be called on main queue
    func fetchAccountList(_ completion: @escaping FetchAccountCompletion) {
        guard let path = Bundle.main.url(forResource: "accounts", withExtension: "csv") else {
            DispatchQueue.main.async {
                completion(.failure(DataProviderError.resourceNotFound))
            }
            return
        }
        queue.async {
            do {
                let dataStr = try String(contentsOf: path, encoding: .utf8)
                let collection = try CSVDecoder().decode([Account].self, from: dataStr)
                let results = collection.sorted(by: { $0.groupId < $1.groupId })
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(DataProviderError.parsingFailure(inner: error)))
                }
            }
        }
    }
}
