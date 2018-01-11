//
//  QATestAppUITests.swift
//  QATestAppUITests
//
//  Created by Gert Andreas on 10.01.18.
//  Copyright © 2018 Gert Andreas. All rights reserved.
//

import XCTest

class QATestAppUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginViewIsVisible() {
        XCTAssertTrue(app.isDisplayingLogin)
    }
    
    func testLoginButtonIsInitiallyDisabled() {
        
        XCTAssertFalse(app.buttons["loginButton"].isEnabled)
    }
    
    func testLoginViewOnlyUsernameInputLoginButtonDisabled() {
        
        let usernameTextField = app/*@START_MENU_TOKEN@*/.textFields["usernameTextField"]/*[[".otherElements[\"loginView\"].textFields[\"usernameTextField\"]",".textFields[\"usernameTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        usernameTextField.tap()
        usernameTextField.typeText("someusername")
        
        XCTAssertFalse(app.buttons["loginButton"].isEnabled)
    }
    
    func testLoginViewOnlyPasswordInputLoginButtonDisabled() {
        
        let passwordTextField = app.secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("somepassword")
        
        XCTAssertFalse(app.buttons["loginButton"].isEnabled)
    }
    
    func testLoginViewLoginButtonEnabled() {
        
        let usernameTextField = app/*@START_MENU_TOKEN@*/.textFields["usernameTextField"]/*[[".otherElements[\"loginView\"].textFields[\"usernameTextField\"]",".textFields[\"usernameTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        usernameTextField.tap()
        usernameTextField.typeText("someusername")
        
        let passwordTextField = app.secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("somepassword")
        
        XCTAssertTrue(app.buttons["loginButton"].isEnabled)
    }
   
}

//
//
//        app/*@START_MENU_TOKEN@*/.secureTextFields["passwordTextField"]/*[[".otherElements[\"loginView\"].secureTextFields[\"passwordTextField\"]",".secureTextFields[\"passwordTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.buttons["loginButton"]/*[[".otherElements[\"loginView\"]",".buttons[\"Go\"]",".buttons[\"loginButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Username"]/*[[".otherElements[\"loginView\"].staticTexts[\"Username\"]",".staticTexts[\"Username\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Password"]/*[[".otherElements[\"loginView\"].staticTexts[\"Password\"]",".staticTexts[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

extension XCUIApplication {
    var isDisplayingLogin: Bool {
        return otherElements["loginView"].exists
    }
}
