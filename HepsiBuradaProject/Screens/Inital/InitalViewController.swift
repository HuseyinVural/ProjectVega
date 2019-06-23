//
//  InitalViewController.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import UIKit

class InitalViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let target = segue.destination as? CampaignsViewController else { return }

    let errorLoger = ErrorLogger(logHandler: LogHandler())
    let responseHadnler = APIResponseHandler()
    let viewModel = CampaignsViewModel(responseHandler: responseHadnler, errorLoger: errorLoger)
    let datasource = CampaingsDataSource(viewModel: viewModel)
    let delegate = CampaingsDelegate(pager: viewModel.pager)

    target.viewModel = viewModel
    target.datasource = datasource
    target.delegate = delegate
  }
}
