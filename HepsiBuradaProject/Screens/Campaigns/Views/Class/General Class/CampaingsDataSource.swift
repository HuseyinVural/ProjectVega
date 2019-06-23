//
//  CampaingsDataSource.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

class CampaingsDataSource: NSObject, UITableViewDataSource {
  var viewModel: DataListable

  init(viewModel: DataListable) {
    self.viewModel = viewModel
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows(in: section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CampaingsCell.identifier(), for: indexPath) as? BaseTableViewCell else {
      fatalError("Cell not created.")
    }
    cell.configure(data: viewModel.viewModel(for: indexPath),indexPath: indexPath)
    return cell
  }
}
