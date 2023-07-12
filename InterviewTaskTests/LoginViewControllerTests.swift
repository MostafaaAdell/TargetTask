//
//  LoginViewControllerTests.swift
//  InterviewTaskTests
//
//  Created by Mustafa on 12/07/2023.
//
import XCTest
@testable import InterviewTask
import Firebase

class LoginViewControllerTests: XCTestCase {
    
    
    var loginViewController: LoginViewController!
    
    override func setUpWithError() throws {
        
        loginViewController = UIStoryboard (name: "Main", bundle: ni1).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        _ = loginViewController.view
        
    }
    
    override func tearDownWithError() throws {
        loginViewController = nil
        
    }
    
    
    func testNavigationBarTintColor() {
        
        // Check that the navigation bar tint color is set correctly
        let expectedColor = UIColor (named: "NearlyBlue")
        
        XCTAssertEqual(loginViewController.navigationController?.navigationBar.tintColor, expectedColor, "Navigation bar tint color should be set to NearlyBlue")
    }
    
    
    func testLoginWithValidCredentials() {
        
        // Check that the login method succeeds with valid credenti
        let expectation = self.expectation(description: "Login should succeed")
        let email = "test@example.com"
        let password = "password"
        Auth.auth().createUser(withEmail: email, password: password) { _ , error in
            XCTAssertNil(error, "Error creating user")
            self.loginViewController.emailTextfield.text = email
            self.loginViewController.passwordTextfield.text = password
            self.loginViewController.loginPressed (UIButton())
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                XCTAssertNil(self.loginViewController.presentedViewController,"Login should succeed and dismiss the LoginViewController")
                expectation.fulfill()
            }
            
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        
    }
    
    func testLoginWithInvalidCredentials() {
        
        // Check that the login method fails with invalid credentia
        let expectation = self.expectation(description: "Login should fail")
        
        let email = "test@example.com"
        let password = "password"
        Auth.auth().createUser(withEmail: email, password: password) { _ , error in
            XCTAssertNil(error, "Error creating user")
            self.loginViewController.emailTextfield.text = email
            self.loginViewController.passwordTextfield.text = "Wrong Password"
            self.loginViewController.loginPressed (UIButton())
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                XCTAssertNil(self.loginViewController.presentedViewController,"Login should fail and show error alert")
                expectation.fulfill()
            }
            
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        
    }
    
    
    func testLoginWithEmptyCredentials() {
        
        let expectation = self.expectation(description: "Login should fail")
        
        let email = "test@example.com"
        let password = "password"
        Auth.auth().createUser(withEmail: email, password: password) { _ , error in
            XCTAssertNil(error, "Error creating user")
            self.loginViewController.emailTextfield.text = ""
            self.loginViewController.passwordTextfield.text = ""
            self.loginViewController.loginPressed (UIButton())
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                XCTAssertNil(self.loginViewController.presentedViewController,"Login should fail and show error alert")
                expectation.fulfill()
            }
            
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        
    }
}
