//
//  MintBank_TestUITests.swift
//  MintBank TestUITests
//
//  Created by Temitope on 01/09/2021.
//

import XCTest

class MintBank_TestUITests: XCTestCase {

    func testLoginTest(){
        
        let password = "pass"
        let number = "08034553322"
        
        XCUIApplication().activate()
        
        let app = XCUIApplication()
        let phoneNumberTextField =  app.textFields["8022312332"]
        XCTAssertTrue(phoneNumberTextField.exists)
        phoneNumberTextField.tap()
        
        phoneNumberTextField.typeText(number)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
          
                        
    }
    
  
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
