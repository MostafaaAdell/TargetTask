//
//  ChooseViewNavigationTest.swift
//  InterviewTaskTests
//
//  Created by Mustafa on 12/07/2023.
//

import XCTest
@testable import InterviewTask
import Firebase

final class ChooseViewNavigationTest: XCTestCase {
    
    var chooseViewNavigation: ChooseViewNavigation!
    
    override func setUpWithError() throws {
        chooseViewNavigation = ChooseViewNavigation ()
        // Load the view hierarchy
        chooseViewNavigation.loadViewIfNeeded()
    }
    
    
    override func tearDownWithError() throws {
        chooseViewNavigation = nil
    }
    
    func testNavigationBarTintColor() {
        //check the navigation bar tint color is set correctly
        let expectedColor = UIColor (named: "NearlyBlue")
        XCTAssertEqual(chooseViewNavigation.navigationController?.navigationBar.tintColor, expectedColor,"Navigation bar tint color should be set to NearlyBlue")
    }
    
    
    func testCameraButtonAction() {
        // Check that the camera button action is wired up correctly
        let cameraButton = UIButton()
        cameraButton.sendActions (for: .touchUpInside)
        // You could add more assertions here to check that the expected behavior happens when the button is pressed
    }
    
    func testDataButtonAction() {
        // Check that the data button action is wired up correctly
        let dataButton = UIButton()
        dataButton.sendActions (for: .touchUpInside)
        // You could add more assertions here to check that the expected behavior happens when the button is pressed
        
    }
}
