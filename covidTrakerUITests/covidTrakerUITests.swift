//
//  covidTrakerUITests.swift
//  covidTrakerUITests
//
//  Created by Paul Ghibeaux on 10/12/2021.
//

import XCTest

class covidTrakerUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = true
        app = XCUIApplication()
        app.launch()

    }
    func testTabBarController() throws {
        // UI tests must launch the application that they test.
        app.launch()
        // passing throw the different view controllers of the tab bar
        app.tabBars.firstMatch.buttons.element(boundBy: 0).tap()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        app.tabBars.firstMatch.buttons.element(boundBy: 2).tap()

    }

    func testSearchController() throws {
        app.launch()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        app.buttons["Get infos 🦠 "].tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
                
    }
    func testHospitalController() throws {
        app.launch()
        app.tabBars.firstMatch.buttons.element(boundBy: 2).tap()
                
    }
}
