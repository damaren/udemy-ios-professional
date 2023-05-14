//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Jose Luis Damaren Junior on 14/05/23.
//

import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {

    // Boundary conditions 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }

    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("123456789012345678901234567890123"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }

    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("123456789"))
    }
    
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("123456A"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("12345678"))
    }
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("123456a"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("12345678"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("asdfqwer1"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("asdfqewrzxcv"))
    }
    
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("123456@"))
    }
    
    func testSpecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("12345678"))
    }
}
