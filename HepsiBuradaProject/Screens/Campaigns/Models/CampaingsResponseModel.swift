//
//  CampaingsResponseModel.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

struct CampaingsResponseModel: Decodable {
  let hotDeals: [Deals]
  let banners: [Banners]
}
