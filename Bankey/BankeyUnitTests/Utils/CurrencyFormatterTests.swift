//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Jose Luis Damaren Junior on 09/05/23.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(96542.85)
        XCTAssertEqual(result.0, "96,542")
        XCTAssertEqual(result.1, "85")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(96542.85)
        XCTAssertEqual(result, "$96,542.85")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.0)
        XCTAssertEqual(result, "$0.00")
    }
}
