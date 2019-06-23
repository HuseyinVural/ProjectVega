//
//  APIEndpoints.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya

private enum URLString {
  enum Debug: String {
    case store = "http://private-d190ab-campaigns19.apiary-mock.com"
  }

  enum Prod: String {
    case store = "http://private-d190ab-campaigns19.apiary-mock.com"
  }
}

protocol APIGeneratable {
  associatedtype APIMethodType

  var apiMethod: APIMethodType { get }
  var defaultParams: [String: String] { get }

  init(apiMethod: APIMethodType, defaultParams: [String: String])
}

protocol StoreAPI: APIGeneratable {
  var baseURL: URL { get }
}

extension StoreAPI {
  var baseURL: URL {
    return URL(string: URLString.Debug.store.rawValue)!
  }
}

protocol GeneralTargetType {
  var method: Moya.Method { get }
  var sampleData: Data { get }
  var headers: [String: String]? { get }
}

extension GeneralTargetType {
  var method: Moya.Method {
    return .get
  }

  public var sampleData: Data {
    return Data()
  }

  public var headers: [String: String]? {
    return nil
  }
}
