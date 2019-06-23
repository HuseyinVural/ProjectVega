//
//  CampaingsViewModelable.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol CampaignsViewModelable: DataManagble, DataListable {
  var datasourceChanged: (() -> Void)? { get set }
  var networkMediator: NetworkMediator<CampaignsAPI> { get }
  var pager: Pageable { get }
}
