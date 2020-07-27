//
//  CSVDecoderTests.swift
//  CSVDecoderTests
//
//  Created by Red Davis on 15/02/2019.
//  Copyright © 2019 Red Davis. All rights reserved.
//

import XCTest
@testable import uiAssignment

class CSVDecoderTests: XCTestCase {
    
    func testDecoding() {
        let data = """
        name,age,city,postcode,birthplace
        _why,45,Bath,BA15NF,
        """
        let decoder = CSVDecoder()
        do {
            let customer = try decoder.decode(Customer.self, from: data)
            XCTAssertEqual(customer.name, "_why")
            XCTAssertEqual(customer.age, 45)
            XCTAssertEqual(customer.city, "Bath")
            XCTAssertEqual(customer.postcode, "BA15NF")
            XCTAssertNil(customer.birthplace)
        }
        catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodingArray() {
        let data = """
        name,age,city,postcode,birthplace
        _why,45,Bath,,London
        Red,15,Bath,BA15NF,London
        """
        let decoder = CSVDecoder()
        do {
            let customers = try decoder.decode([Customer].self, from: data)
            XCTAssertEqual(customers.count, 2)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testKeyNotExisting() {
        let data = """
        error,age,city,postcode,birthplace
        _why,45,Bath,BA15NF,London
        """
        let decoder = CSVDecoder()
        do {
            _ = try decoder.decode(Customer.self, from: data)
            XCTFail()
        }
        catch let error as DecodingError {
            switch error {
            case .keyNotFound(let key, _):
                XCTAssertEqual(key.stringValue, "name")
            default:
                XCTFail("Incorrect error \(error)")
            }
        }
        catch {
            XCTFail("Incorrect error \(error)")
        }
    }
    
    func testAccountDecoding() {
        let data = """
        "Account group id","Account group name","Account name","IBAN","Amount"
        "100","Current Accounts","Joint Account","NL25 TRIO 0269 8445 60",100000
        """
        let decoder = CSVDecoder()
        do {
            let realAccount = try decoder.decode(Account.self, from: data)
            XCTAssertEqual(realAccount.groupName, "Current Accounts")
            XCTAssertEqual(realAccount.name, "Joint Account")
            XCTAssertEqual(realAccount.amount, 100000)
            XCTAssertEqual(realAccount.iban, "NL25 TRIO 0269 8445 60")
        }
        catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
}


// MARK: Customer

fileprivate struct Customer: Decodable {
    let name: String
    let age: Int
    let city: String
    let postcode: String?
    let birthplace: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case city
        case postcode
        case birthplace
    }
}
