//
//  APIError.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

enum APIError {
  case general(errorMessage: String)
}

extension APIError {
  var message: String {
    switch self {
    case .general(let message):
      return message
    }
  }
}
