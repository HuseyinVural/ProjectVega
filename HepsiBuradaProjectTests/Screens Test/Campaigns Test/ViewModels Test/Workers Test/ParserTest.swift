//
//  ParserTest.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import XCTest
import Foundation

@testable import HepsiBuradaProject

class ParserTest: XCTestCase {

  let CampaingsListAPIResponse = "CampaingsList"

  func test_WhenParseData_ThenParsedDataIsReturned() {
    let campaingsResponse = getStubbedReponse()
    let parser = Parser()
    parser.timeHelper = MockTimeHelper()
    let parsedResponse = parser.parse(pureModel: campaingsResponse)
    XCTAssertEqual(parsedResponse.count, 10, "Parse result is not correct.")
  }

  func test_WhenParseData_ThenMockTimerMethodesCalled() {
    let campaingsResponse = getStubbedReponse()
    let parser = Parser()
    let mocTimeHelper = MockTimeHelper()
    parser.timeHelper = mocTimeHelper
    let parsedResponse = parser.parse(pureModel: campaingsResponse)
    mocTimeHelper.verfiy(expected: parsedResponse.count)
  }

  func test_WhenGetImage_ThenCorrectImageValueIsReturned() {
    let parser = Parser()
    let expectedImage = CampaingStubber.getBanner(width: 0, height: 0, url: "Image3")
    let banners = [CampaingStubber.getBanner(width: 0, height: 0, url: "Image1"),
                   CampaingStubber.getBanner(width: 0, height: 0, url: "Image2"), expectedImage]
    let image = parser.getImageByIndex(with: 0, images: banners)

    XCTAssertEqual(image.url, expectedImage.image.url, "Parse result is not correct.")
  }

}

extension ParserTest {
  func getStubbedReponse(file: StaticString = #file, line: UInt = #line) -> CampaingsResponseModel {
    do {
      let responseData = JSONHelper().readjson(CampaingsListAPIResponse)
      let campaingsResponse = try JSONDecoder().decode(CampaingsResponseModel.self, from: responseData)
      return campaingsResponse
    } catch {

      XCTFail("CampaingsResponseModel decodable fail.",file: file, line: line)
    }
    fatalError()
  }
}

class MockTimeHelper: TimeHelpable {
  var timeRemainingCallCount = 0
  var timestampToDateCallCount = 0

  func timeRemaining(date: Date) -> String {
    timeRemainingCallCount += 1
    return ""
  }

  func timestampToDate(time: String) -> Date {
    timestampToDateCallCount += 1
    return Date()
  }

  func verfiy(expected callCount: Int, file: StaticString = #file, line: UInt = #line){
    XCTAssertEqual(self.timeRemainingCallCount, callCount, "Error Handler log wrong call count", file: file, line: line)
    XCTAssertEqual(self.timestampToDateCallCount, callCount, "Error Handler log wrong call count", file: file, line: line)
  }
}
