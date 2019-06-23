//
//  APIResult.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

enum APIResult<T> {
  case success(T)
  case failure(APIError)
}
