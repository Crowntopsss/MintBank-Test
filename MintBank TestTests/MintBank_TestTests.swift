//
//  MintBank_TestTests.swift
//  MintBank TestTests
//
//  Created by Temitope on 01/09/2021.
//

import XCTest
@testable import MintBank_Test
@testable import FlagPhoneNumber


class MintBank_TestTests: XCTestCase {
    let textfield = FPNTextField()
    let button = UIButton()

    func testSetFlag() {
        textfield.setFlag(countryCode: FPNCountryCode(rawValue: "NG")!)
        textfield.set(phoneNumber: "08022122344")
        XCTAssertEqual(textfield.selectedCountry?.code.rawValue, "NG")
    }
    
    func testSetPhoneNumberCode() {
        textfield.setFlag(countryCode: FPNCountryCode(rawValue: "NG")!)
        textfield.set(phoneNumber: "08022122344")
        XCTAssertEqual(textfield.selectedCountry?.phoneCode, "+234")
    }
    
    func testSetPhoneNumber() {
            textfield.set(phoneNumber: "+2348123111234")
            XCTAssertEqual(textfield.selectedCountry?.phoneCode, "+234")
            XCTAssertEqual(textfield.selectedCountry?.code.rawValue, "NG")
            XCTAssertEqual(textfield.text, "812 311 1234")
    }
    


    
}
