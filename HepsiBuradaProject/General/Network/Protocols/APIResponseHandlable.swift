//
//  APIResponseHandlable.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya
import Result

protocol APIResponseHandlable {
  func process<T: Decodable>(_ result: Result<Response, MoyaError>, ofType type: T.Type, _ errorLogger: ErrorLoggable) -> APIResult<T>
}
