//
//  CampaingsModelTest.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import HepsiBuradaProject

class CampaingsModelTest: XCTestCase {

  func test_WhenCreateNewModel_ThenSetCorrentPropertyValues() {
    let expectedImage = CampaingStubber.getBanner(width: 100, height: 100, url: "ImageName").image
    let expectedTitle = "Mock Tile"
    let expectedRemaining = "23 Hours, 59 Minutes, 59 Seconds Remaining"
    let model = CampaingsModel(title: "Mock Tile", expirationDate: expectedRemaining, image: expectedImage)

    XCTAssertNotNil(model.hash, "Hash ID is important.")
    XCTAssertEqual(model.title, expectedTitle, "Could not assign title")
    XCTAssertEqual(model.expirationDate, expectedRemaining, "Could not assign expirationDate")
    XCTAssertEqual(model.image.url, expectedImage.url, "Could not assign image")
    XCTAssertNotNil(model.calcultedHeight, "CalcultedHeight is important.")
  }

  func test_WhenGetRatio_ThenCorrectValueIsReturned() {
    let value = CampaingsModel.getRatio(width: 100, height: 100)
    XCTAssertEqual(value, 1, "Aspect retio not correct")
  }

  func test_WhenGetHeight_ThenCorrectValueIsReturned() {
    let value = CampaingsModel.getImageCalculatesHeight(ratio: 2)
    let expectedValue = UIScreen.main.bounds.width / 2
    XCTAssertEqual(value, expectedValue, "Cell height not correct")
  }
}
