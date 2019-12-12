//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Brandi Bailey on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        
    }
    
    /*
     - Collection View Controller -
     Async test for photo loading
     Arrow in navbar switches sols
     
     - Detail View Controller -
     Click on image from collection view controller and go to detail view controller
     View corresponding image in detail view controller
     save image to photo library
     Clicking Sol name in navbar from DetailVC takes you back to Sol Collection View VC
     */
    
    // Test async for photo loading
    
    func testForPhotoLoading() {
        let fetchedPhotosExpectation = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.cells.images, handler: nil)
        
        fetchedPhotosExpectation.expectationDescription = "Photos have been fetched and are displayed."
        waitForExpectations(timeout: 5)
    }
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
        
    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private func photoCell(for index: Int) -> XCUIElement {
        return XCUIApplication().cells["photoCell\(index)"]
    }

}
