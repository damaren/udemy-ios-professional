//
//  AccountTests.swift
//  BankeyUnitTests
//
//  Created by Jose Luis Damaren Junior on 10/05/23.
//

import Foundation
import XCTest

@testable import Bankey

class AccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """

        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let result = try! decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(result[0].id, "1")
        XCTAssertEqual(result[0].type, .Banking)
        XCTAssertEqual(result[0].name, "Basic Savings")
        XCTAssertEqual(result[0].amount, 929466.23)
        XCTAssertEqual(result[0].createdDateTime.monthDayYearString, "jun. 21, 2010")
        
        XCTAssertEqual(result[1].id, "2")
        XCTAssertEqual(result[1].type, .Banking)
        XCTAssertEqual(result[1].name, "No-Fee All-In Chequing")
        XCTAssertEqual(result[1].amount, 17562.44)
//        XCTAssertEqual(result[0].createdDateTime, "2011-06-21T15:29:32Z")
        
    }
}
