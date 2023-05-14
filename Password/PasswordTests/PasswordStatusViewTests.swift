//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Jose Luis Damaren Junior on 14/05/23.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }

    /*
     if shouldResetCriteria {
         // Inline validation (✅ or ⚪️)
     } else {
         ...
     }
     */

    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // ⚪️
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // loss of focus
    }

    /*
     if shouldResetCriteria {
         ...
     } else {
         // Focus lost (✅ or ❌)
     }
     */

    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }

    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage) // ❌
    }
}

class PasswordStatusViewTests_Validate_Three_of_Four: XCTestCase {
    var statusView: PasswordStatusView!
    let digitAndUppercase = "12345678A"
    let digitAndUppercaseAndLowerCase = "12345678Aa"
    let digitAndUppercaseAndLowerCaseAndSpecialChars = "12345678Aa@"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }
    
    func testValidateFourOfFour() throws {
        XCTAssertTrue(statusView.validate(digitAndUppercaseAndLowerCaseAndSpecialChars))
    }
    
    func testValidateThreeOfFour() throws {
        XCTAssertTrue(statusView.validate(digitAndUppercaseAndLowerCase))
    }
    
    func testValidateTwoOfFour() throws {
        XCTAssertFalse(statusView.validate(digitAndUppercase))
    }
}
