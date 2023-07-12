//
//  MovieCellTests.swift
//  InterviewTaskTests
//
//  Created by Mustafa on 12/07/2023.
//

import XCTest
@testable import InterviewTask

class MovieCellTests: XCTestCase {
    
    
    var movieCell: MovieCell!
    
    override func setUpWithError() throws {
        
        
        movieCell = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout()).dequeueReusableCell(withReuseIdentifier: "MovieCell",
                                                                                                                          
        for: IndexPath(item: 0, section: 0)) as? MovieCell
        
    }
    
    
    override func tearDownWithError() throws {
        
        movieCell = nil
        
    }
    
    func testMovie Image() {
        
        // Check that the movie image is not nil
        XCTAssertNotNil(movieCell.movieImage.image, "Movie image should not be nil")
    }
    
    func testMovieTitle() {
        
        // Check that the movie title is not nil and has non-zero 1
        XCTAssertNotNil(movieCell.movieTitle.text, "Movie title should not be nil")
        XCTAssertGreaterThan (movieCell.movieTitle.text!.count, 0,"Movie title should have non-zero length")
        
    }
    
    func testCollectionViewLoadsData() {
        
        
        let sut = MovieCollectionView()
        // Perform fetch network data
        wait (for: [sut.moviesArray != nil], timeout: 10)
        XCTAssertEqual(sut.collectionView.numberOfItems (inSection: 0),sut.moviesArray! .count)
        let cell = sut.collectionView.cellForItem(at: IndexPath(row: 0,section: 0)) as! MovieCell
        XCTAssertEqual(cell.movieTitle.text, sut.moviesArray! [0].title)
        
    }
}
   
