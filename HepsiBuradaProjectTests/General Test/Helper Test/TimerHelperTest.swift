//
//  TimerHelperTest.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
@testable import HepsiBuradaProject
import XCTest

class TimerHelperTest: XCTestCase {

  func test_WhenPassStringDate_ThenCorrectDateObjectReturned() {
    let expStringDate = "2019-05-21T11:30:00+03:00"
    let timeHelper = TimeHelper()
    let time = timeHelper.timestampToDate(time: expStringDate)
    let expectedUnixTime: TimeInterval = 1558427400.0

    XCTAssertEqual(time.timeIntervalSince1970, expectedUnixTime, "Calculated date wrong.")
  }

  func test_WhenSendExpireDate_ThenReturnCorrectRemainingTime(){
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    let timeHelper = TimeHelper()
    let remainingStringTime = timeHelper.timeRemaining(date: tomorrow)
    let expectedRemainingTime = "23 Hours, 59 Minutes, 59 Seconds Remaining"
    XCTAssertEqual(remainingStringTime, expectedRemainingTime, "Remaining time is not correct.")
  }

  func test_WhenSendEndedExpireDate_ThenReturnCorrectRemainingText(){
    let yesterDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    let timeHelper = TimeHelper()
    let remainingStringTime = timeHelper.timeRemaining(date: yesterDay)
    let expectedRemainingTime = Strings.ErrorMessageDescriptions.campaignEnded
    XCTAssertEqual(remainingStringTime, expectedRemainingTime, "Remaining time is not correct.")
  }

  func test_WhenGetdateComponentFormatter_ThenCorrectComponentPropertesReturned(){
    let timeHelper = TimeHelper()
    let component = timeHelper.dateComponentFormatter
    let expectedUnits: NSCalendar.Unit = [.day, .hour, .minute, .second]
    let expectedStyle: DateComponentsFormatter.UnitsStyle = .full
    XCTAssertEqual(component.allowedUnits, expectedUnits, "DateComponent Formatters units is not correct.")
    XCTAssertEqual(component.unitsStyle, expectedStyle, "DateComponent Formatters unit style is not correct.")
  }
}

