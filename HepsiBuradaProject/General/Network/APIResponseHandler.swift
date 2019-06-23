//
//  APIResponseHandler.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya
import Result

struct APIResponseHandler: APIResponseHandlable {
  private let generalErrorMessage = Strings.ErrorMessageDescriptions.generalErrorMessage

  func process<T: Decodable>(_ result: Result<Response, MoyaError>, ofType type: T.Type, _ errorLogger: ErrorLoggable) -> APIResult<T> {
    switch result {
    case .success(let response):
      do {
        return try decode(response.data, to: type)
      } catch let error {
        errorLogger.log(error, forURL: response.requestURL)
        return APIResult.failure(.general(errorMessage: generalErrorMessage))
      }
    case .failure(let error):
      errorLogger.log(error, forURL: error.response!.requestURL)
      return APIResult.failure(.general(errorMessage: generalErrorMessage))
    }
  }

  func decode<T: Decodable>(_ data: Data, to type: T.Type) throws -> APIResult<T> {
    let mappedData = try JSONDecoder().decode(T.self, from: data)
    return APIResult<T>.success(mappedData)
  }
}
