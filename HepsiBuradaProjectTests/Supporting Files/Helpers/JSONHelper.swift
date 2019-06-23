//
//  JSONHelper.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import XCTest

class JSONHelper {
  func readjson(_ fileName: String, file: StaticString = #file, line: UInt = #line) -> Data {
    let bundle = Bundle(for: type(of: self))

    guard let url = bundle.url(forResource: fileName, withExtension: "json", subdirectory: nil) else {
      XCTFail("URL not found", file: file, line: line)
      return Data()
    }

    guard let data = try? Data(contentsOf: url) else {
      XCTFail("Data not found in file", file: file, line: line)
      return Data()
    }

    return data
  }
}
