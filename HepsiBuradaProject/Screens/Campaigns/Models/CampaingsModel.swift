//
//  CampaingsModel.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

struct CampaingsModel {
  var hash: String
  let title: String
  let expirationDate: String
  let image: Image
  let calcultedHeight: CGFloat

  init(title: String, expirationDate: String, image: Image) {
    self.hash = UUID().uuidString
    self.title = title
    self.expirationDate = expirationDate
    self.image = image
    self.calcultedHeight = CampaingsModel.getImageCalculatesHeight(ratio: CampaingsModel.getRatio(width: image.width, height: image.height))
  }

  static func getRatio(width: Int, height: Int) -> CGFloat {
    return CGFloat(width) / CGFloat(height)
  }

  static func getImageCalculatesHeight(ratio: CGFloat) -> CGFloat {
    return UIScreen.main.bounds.width / ratio
  }
}

extension CampaingsModel: Equatable {
  static func == (lhs: CampaingsModel, rhs: CampaingsModel) -> Bool {
    return lhs.hash == rhs.hash
  }
}
