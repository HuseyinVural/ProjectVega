//
//  CampaingsDelegate.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

class CampaingsDelegate: NSObject, TableDelegatable {
  var pager: Pageable

  init(pager: Pageable) {
    self.pager = pager
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    callNextPage(tableView, forRowAt: indexPath)
  }

  func callNextPage(_ tableView: UITableView, forRowAt indexPath: IndexPath) {
    let rowsCount = tableView.numberOfRows(inSection: indexPath.section)
    if indexPath.row >= rowsCount - 5 {
      pager.getCampaigns(with: .next)
    }
  }
}
