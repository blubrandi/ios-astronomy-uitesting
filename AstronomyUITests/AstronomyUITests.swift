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

        continueAfterFailure = false

        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: Test List
    
    /*
     - Collection View Controller -
     Async test for photo loading ✅
     Arrow in navbar switches sols ✅
     
     - Detail View Controller -
     Tap on image from collection view controller and go to detail view controller ✅
     View corresponding image in detail view controller ✅
     Save image to photo library ✅
     Clicking Sol name (as back button) in navbar from DetailVC takes you back to Sol Collection View VC
     */
    
    //MARK: Tests
    
    // Test async for photo loading
    func testForPhotoLoading() {
        let fetchedPhotosExpectation = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.cells.images, handler: nil)
        
        fetchedPhotosExpectation.expectationDescription = "Photos have been fetched and are displayed."
        waitForExpectations(timeout: 5)
    }
    
    func testImageGoesToDetailVC() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 7).children(matching: .other).element.tap()
    }
    
    func testSaveImage() {
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let photodetailviewcontrollerSavebuttonButton = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photodetailviewcontrollerSavebuttonButton.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
    }
    
    func testSwitchSolCollectionView() {
        
        app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        app.navigationBars["Sol 16"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        app.navigationBars["Sol 16"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        
    }
    
    func testBackFromDetailVC() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        
    }
    

    
    //MARK: Properties
    
    private var app = XCUIApplication()
    
    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
//    private func photoCell(for index: Int) -> XCUIElement {
//        return XCUIApplication().cells["photoCell\(index)"]
//    }

}
