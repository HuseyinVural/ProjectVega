//
//  CampaingStubber.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
@testable import HepsiBuradaProject

struct CampaingStubber {
  static func makeCampaing() -> CampaingsModel {
    let banner = CampaingStubber.getBanner()
    let deals = CampaingStubber.getDeals()

    return CampaingsModel(title: deals.title, expirationDate: deals.expirationDate, image: banner.image)
  }

  static func getDeals(title: String = "Header", expirationDate: String = "23 Hours, 59 Minutes, 59 Seconds Remaining") -> Deals {
    return Deals(title: title, expirationDate: expirationDate)
  }

  static func getBanner(width: Int = 100, height: Int = 100, url: String = "https://dummyimage.com/400X100/e3de81/0010f0.png") -> Banners {
    return Banners(image: Image(width: 100, height: 100, url: "https://dummyimage.com/400X100/e3de81/0010f0.png"))
  }
}

