//
//  APIResponseMapper.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya
import Result

struct APIResponseMapper: APIResponseMappable {

  let apiResponseHandler: APIResponseHandlable
  let errorLogger: ErrorLoggable

  init(apiResponseHandler: APIResponseHandlable, errorLogger: ErrorLoggable) {
    self.apiResponseHandler = apiResponseHandler
    self.errorLogger = errorLogger
  }

  func map<DecodableObject: Decodable>(_ result: Result<Moya.Response, MoyaError>, of type: DecodableObject.Type, _ response: @escaping (APIResult<DecodableObject>) -> Void) {
    response(apiResponseHandler.process(result, ofType: type, errorLogger))
  }
}
