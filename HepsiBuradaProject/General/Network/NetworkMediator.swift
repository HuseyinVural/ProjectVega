//
//  NetworkMediator.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya
import Result

final class NetworkMediator<DHProviderType: TargetType> {

  let apiProvider: MoyaProvider<DHProviderType>
  let apiResponseMapper: APIResponseMappable

  init(apiProvider: MoyaProvider<DHProviderType>, apiResponseMapper: APIResponseMappable) {
    self.apiProvider = apiProvider
    self.apiResponseMapper = apiResponseMapper
  }

  deinit {
    print("NetworkMediator deinit")
  }
}

extension NetworkMediator {
  /// Request with Moya's TargetType conforming context
  func request<T: Decodable>(withTarget target: DHProviderType, _ response: @escaping (APIResult<T>) -> Void) {
    DispatchQueue.global(qos: .utility).async {
      self.apiProvider.request(target, completion: self.map(T.self, response))
    }
  }

  /// Returns a closure for mapping result of Moya's Result to DHAPIResult
  private func map<T: Decodable>(_ type: T.Type, _ response: @escaping (APIResult<T>) -> Void) -> (Result<Moya.Response, MoyaError>) -> Void {
    return { [weak self] result in
      guard let self = self else {
        return
      }
      self.apiResponseMapper.map(result, of: T.self, response)
    }
  }
}

extension NetworkMediator {
  var defaultParams: [String: String] {
    var defaultParamsDict: [String: String] = [:]
    defaultParamsDict["dummyDefaault"] = "hvrl"
    return defaultParamsDict
  }
}
