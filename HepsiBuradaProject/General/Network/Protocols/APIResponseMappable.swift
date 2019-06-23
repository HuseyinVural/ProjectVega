//
//  APIResponseMappable.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Moya
import Result

protocol APIResponseMappable {
  func map<DecodableObject: Decodable>(_ result: Result<Moya.Response, MoyaError>, of type: DecodableObject.Type, _ response: @escaping (APIResult<DecodableObject>) -> Void)
}
