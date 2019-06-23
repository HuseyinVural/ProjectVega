//
//  Moya+Extenstions.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya

private let urlNotFound = "URL not found"

extension Moya.Response {
  var requestURL: String {
    return self.request?.url?.absoluteString ?? urlNotFound
  }
}
