//
//  HepsiBuradaProjectUITests.swift
//  HepsiBuradaProjectUITests
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import XCTest

class HepsiBuradaProjectUITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func hiUITest() {
      XCUIApplication().buttons["SHOW"].tap()
      XCUIApplication().navigationBars["HepsiBuradaProject.CampaignsView"].buttons["Back"].tap()
      // Kapsamlı bir appimiz olsaydı page object patter ile güzel XCUI testler yazabilirdik.
    }
}
