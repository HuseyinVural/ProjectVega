//
//  CampaignsViewController.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import UIKit

class CampaignsViewController: BaseViewController {
  var viewModel: CampaignsViewModelable!
  var datasource: UITableViewDataSource?
  var delegate: TableDelegatable?
  @IBOutlet var tableView: UITableView?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.bindTableView()
    self.bindViewModel()
    viewModel.pager.getCampaigns(with: .initial)
  }

  func bindTableView(){
    let id = CampaingsCell.identifier()
    let cell = UINib(nibName: id, bundle: nil)
    tableView?.delegate = delegate
    tableView?.dataSource = datasource
    tableView?.register(cell, forCellReuseIdentifier: id)
    tableView?.rowHeight = UITableView.automaticDimension
    tableView?.estimatedRowHeight = 350
  }

  final func bindViewModel() {
    viewModel.datasourceChanged = datasourceChanged()
  }

  func datasourceChanged() -> () -> Void {
    return { [weak self] in
      DispatchQueue.main.async {
        self?.tableView?.reloadData()
      }
    }
  }
}
