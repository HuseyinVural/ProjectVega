//
//  ErrorLogger.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

class ErrorLogger: ErrorLoggable {
  let logHandler: LogHandlable
  init(logHandler: LogHandlable) {
    self.logHandler = logHandler
  }

  func log(_ error: Error, forURL requestURL: String) {
    let additionalUserInfo = ["Request URL": requestURL]
    logHandler.storeLog(error, additionalInfo: additionalUserInfo)
  }
}

struct LogHandler: LogHandlable {
  func storeLog(_ error: Error, additionalInfo: [String : String]) {
    debugPrint("Error: \(error), info: \(additionalInfo)")
  }
}
