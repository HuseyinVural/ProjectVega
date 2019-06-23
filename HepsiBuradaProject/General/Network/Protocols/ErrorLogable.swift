//
//  ErrorLogable.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol ErrorLoggable {
  func log(_ error: Error, forURL requestURL: String)
}

protocol LogHandlable {
  func storeLog(_ error: Error, additionalInfo: [String: String])
}
