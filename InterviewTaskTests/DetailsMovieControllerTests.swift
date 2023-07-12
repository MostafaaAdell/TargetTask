//
//  DetailsMovieControllerTests.swift
//  InterviewTaskTests
//
//  Created by Mustafa on 12/07/2023.
//

import XCTest
@testable import InterviewTask
import Firebase

final class DetailsMovieControllerTests: XCTestCase {

    override func setUpWithError() throws {
        
        var detailsMovieController: DetailsMovieController!
        
    override func setUpWithError() throws {
            
        detailsMovieController = DetailsMovieController()
        // Set up the view hierarchy
            
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
           detailsMovieController = storyboard.instantiateViewController(withIdentifier: "DetailsMovieController") as? DetailsMovieController
           detailsMovieController.movieDetails = Movie(title: "Test Movie”, rating: 4.5, year: 2021", thumbnail: "http://example.com/image.jpg")
        
           _ = detailsMovieController.view

        }
        
     override func tearDownWithError() throws {
            
           detailsMovieController = nil
            
        }
        
     func testNavigationBarTintColor() {
            
        // Check that the navigation bar tint color is set correctl
        let expectedColor = UIColor (named: "NearlyBlue")
         
        XCTAssertEqual(detailsMovieController.navigationController?.navigationBar.tintColor, expectedColor, "Navigation bar tint color should set to NearlyBlue")
        }
     func testMovieDetails() {
         
        // Check that the movie details are displayed correctly
        XCTAssertEqual(detailsMovieController.titleLabel.text, "Test Movie", "Movie title should be displayed")
        XCTAssertEqual(detailsMovieController.ratingLabel.text, "4.5", "Movie rating should be displayed")
        XCTAssertEqual(detailsMovieController.yearLabel.text, "2021", "Movie year should be displayed")
        }
        
     func testThumbnailImage() {
         
        // Check that the thumbnail image is loaded correctly
        let expectedImage = UIImage(named: "placeholder")
        XCTAssertEqual(detailsMovieController.detailsImage.image, expected Image, "Thumbnail image should be set to the placeholder image before the URL is loaded")
        detailsMovieController.viewDidLoad()
        XCTAssertNotNil(detailsMovieController.detailsInage. image,
        "Thumbnail image should be loaded from the URL")

}
