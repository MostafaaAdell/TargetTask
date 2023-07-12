//
//  ImageViewControllerTests.swift
//  InterviewTaskTests
//
//  Created by Mustafa on 12/07/2023.
//

import XCTest
@testable import InterviewTask

final class ImageViewControllerTests: XCTestCase {
    
    var imageViewController: ImageViewController!
    
    override func setUpWithError() throws {
        
        
        imageViewController = UIStoryboard (name: "Main", bundle: nil).instantiateViewController (withIdentifier: "ImageViewController") as? ImageViewController
        
        _ = imageViewController.view
    }
    
    override func tearDownWithError() throws {
        
        imageViewController = nil
    }
    func testNavigationBarTintColor() {
        
        // Check that the navigation bar tint color is set correctl
        
        let expectedColor = UIColor (named: "NearlyBlue")
        
        
        XCTAssertEqual(imageViewController.navigationController?.navigationBar.tintColor, expectedColor, "Navigation bar tint color should be set to NearlyBlue")
        
    }
    
    func testImagePickerController() {
        
        // Check that the image picker controller is presented when the camera button is pressed
        
        let cameraButton = UIBarButtonItem()
        
        
        cameraButton.action = #selector(imageViewController.cameraPressed (_:))
        cameraButton.target = imageViewController
        UIApplication.shared.sendAction(cameraButton.action!, to: cameraButton.target, from: nil, for: nil)
        XCTAssertTrue (imageViewController.presentedViewController is UIImagePickerController, "Image picker controller should be presented when the camera button is pressed")
    }
    
    func testDetectHotdog() {
        
        // Check that the detect() method correctly identifies a ho tdog image
        
        
        let bundle = Bundle(for: type(of: self))
        
        guard let image = UIImage(named: "hotdog", in: bundle, wit  h: nil),
              let ciImage = CIImage(image: image) else { fatalError("Couldn't load hotdog image or convert it to CIImage")
            
        }
        
        imageViewController.detect(image: ciImage)
        XCTAssertEqual(imageViewController.navigationItem.title, "Hotdog!", "Title should be 'Hotdog!' when a hotdog image is detecte d")
        XCTAssertEqual(imageViewController.navigationController?.navigationBar.barTintColor, UIColor.green, "Navigation bar tint color should be green when a hotdog image is detected")
        
        
    }
    
    func testDetectNotHotdog() {
        
    
        // Check that the detect() method correctly identifies a no n-hotdog image
    
        let bundle = Bundle (for: type(of: self))
        guard let image = UIImage(named: "not-hotdog", in: bundle,with: nil),
              let ciImage = CIImage(image: image) else {
            fatalError("Couldn't load non-hotdog image or convert it to CIImage")
            
        }
    
        imageViewController.detect(image: ciImage)
        XCTAssertEqual(imageViewController.navigationItem.title, "Not Hotdog!", "Title should be 'Not Hotdog!' when a non-hotdog image is detected")
        XCTAssertEqual(imageViewController.navigationController?.navigationBar.barTintColor, UIColor.red, "Navigation bar tint color s hould be red when a non-hotdog image is detected")
    }
}
