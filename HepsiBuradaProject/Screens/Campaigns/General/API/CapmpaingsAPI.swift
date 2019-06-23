//
//  Capmpaings.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya

enum CampaignsAPIMethod {
  case getCampaings(forPageID: Int)
  case main
}

struct CampaignsAPI: StoreAPI, GeneralTargetType {
  let apiMethod: CampaignsAPIMethod
  let defaultParams: [String: String]
}

extension CampaignsAPI: TargetType {
  var path: String {
    switch apiMethod {
    case .getCampaings(let forPageID):
      return "/campaigns/{\(forPageID)}"
    case .main:
      return ""
    }
  }

  var task: Task {
    let params: [String: String] = [:]

    switch apiMethod {
    case .getCampaings(_): break
    case .main: break
    }

    return .requestParameters(parameters: defaultParams.merging(params) { (_, new) in new }, encoding: URLEncoding.default)
  }

  var method: Moya.Method {
    switch apiMethod {
    case .getCampaings:
      return Moya.Method.get
    default:
      return Moya.Method.post
    }
  }
}
