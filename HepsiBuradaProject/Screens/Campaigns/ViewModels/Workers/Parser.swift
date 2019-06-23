//
//  Parser.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol Parsable {
  func parse(pureModel: CampaingsResponseModel) -> [CampaingsModel]
}

class Parser: Parsable {
  var timeHelper: TimeHelpable = TimeHelper()

  func parse(pureModel: CampaingsResponseModel) -> [CampaingsModel] {
    return pureModel.hotDeals.enumerated().map({ (index,deals) -> CampaingsModel in
      let image = getImageByIndex(with: index, images: pureModel.banners)
      let expirationDate = timeHelper.timeRemaining(date: timeHelper.timestampToDate(time: deals.expirationDate))
      return CampaingsModel(title: deals.title, expirationDate: expirationDate, image: image)
    })
  }

  func getImageByIndex(with index: Int, images: [Banners]) -> Image {
    return images[index].image
  }
}
