//
//  DataListable.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol DataListable: AnyObject {
  func numberOfRows(in section: Int) -> Int
  func viewModel(for indexPath: IndexPath) -> CampaingsModel
}
