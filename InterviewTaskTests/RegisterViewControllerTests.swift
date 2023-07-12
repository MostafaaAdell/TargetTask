//
//  RegisterViewControllerTests.swift
//  InterviewTaskTests
//
//  Created by Mustafa on 12/07/2023.
//

import XCTest
@testable import InterviewTask
import Firebase

final class RegisterViewControllerTests: XCTestCase {

    func testViewDidLoad() {
        
        let vc = RegisterViewController()
        XCTAssertNotNil(vc.view)
    }
    
    func testFieldsRequired() {

    let vc = RegisterViewController()

    // Empty fields
    vc.pressRegister (vc)
    XCTAssertTrue (vc.emailTextfield.text!.isEmpty, "Email field should be empty")

    // Email only

    vc.emailTextfield.text = "test@example.com"
    vc.press Register (vc)
    XCTAssertTrue (vc.passwordTextfield.text!.isEmpty, "Password field should be empty")

    // Password only

    vc.emailTextfield.text =
    vc.passwordTextfield.text = "123456"
    vc.pressRegister (vc)
    XCTAssertTrue (vc.emailTextfield.text!.isEmpty, "Email field should be empty")

    }

    func testRegistrationNavigates () {

    
        let vc = RegisterViewController()
        vc.emailTextfield.text = "test@example.com"
        vc.passwordTextfield.text = "123456"
        vc.press Register (vc)
        XCTAssertTrue (vc.isNavigationController()?.viewControllers.coun

        t == 2,"Should navigate to next screen after registration")
    }
    
    func testErrorOnInvalidCredentials() {

    
        let vc = RegisterViewController ()

    
        vc.emailTextfield.text = "invalidemail"
        vc.passwordTextfield.text = "short"
        vc.pressRegister (vc)
        XCTAssertNotNil(vc.view.ViewWithTag(1) as! UIAlertController,"Should display error alert for invalid credentials")

    }

  
  

}
