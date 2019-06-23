//
//  DataManagable.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol DataManagble: AnyObject {
  func setDataSource(data: [CampaingsModel])
  func clearDataSource()
}
