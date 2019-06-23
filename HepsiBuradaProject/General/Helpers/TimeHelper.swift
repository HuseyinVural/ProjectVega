//
//  TimeHelper.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol TimeHelpable {
  func timeRemaining(date: Date) -> String
  func timestampToDate(time: String) -> Date
}

class TimeHelper: TimeHelpable {
  let dateComponentFormatter: DateComponentsFormatter = {
    var formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.day, .hour, .minute, .second]
    formatter.unitsStyle = .full
    return formatter
  }()

  func timestampToDate(time: String) -> Date {
    let formater = DateFormatter()
    formater.dateFormat="yyyy-MM-dd'T'HH:mm:ssZ"
    return formater.date(from: time) ?? Date()
  }

  func timeRemaining(date: Date) -> String {
    if date < Date() {
      return Strings.ErrorMessageDescriptions.campaignEnded
    }
    return ((dateComponentFormatter.string(from:  Date(), to: date) ?? "")+" "+"Remaining").capitalized
  }
}
