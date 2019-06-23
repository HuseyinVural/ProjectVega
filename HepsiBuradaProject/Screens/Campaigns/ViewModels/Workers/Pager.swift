//
//  Pager.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation

enum PaginationType {
  case next, initial
}

protocol Pageable {
  func getCampaigns(with paginationType: PaginationType)
}

class Pager: Pageable {
  private var networkMediator: NetworkMediator<CampaignsAPI>
  var currentPage = 0
  private weak var viewModel: DataManagble?
  var pageRequestEnd: Bool = true

  let parser: Parsable
  init(viewModel: DataManagble, parser: Parsable, networkMediator: NetworkMediator<CampaignsAPI>) {
    self.viewModel = viewModel
    self.parser = parser
    self.networkMediator = networkMediator
  }

  func getCampaigns(with paginationType: PaginationType) {
    if !pageRequestEnd { return }
    pageRequestEnd = false
    checkInitalPage(paginationType: paginationType)
    let pageID = getRequestPageIndex(with: paginationType)
    let apiMethode = CampaignsAPIMethod.getCampaings(forPageID: pageID)
    let target = CampaignsAPI(apiMethod: apiMethode, defaultParams: [:])
    networkMediator.request(withTarget: target, campaignsResponseHandle())
  }

  func campaignsResponseHandle() -> (APIResult<CampaingsResponseModel>) -> Void {
    return { [weak self] (result: APIResult<CampaingsResponseModel>) -> Void in
      guard let self = self else { return }
      switch result {
      case .success(let campaings):
        self.viewModel?.setDataSource(data: self.parser.parse(pureModel: campaings))
        self.updateCurrentPage()
      case .failure: break
      }
    }
  }

  func checkInitalPage(paginationType: PaginationType){
    if paginationType == .initial {
      self.viewModel?.clearDataSource()
    }
  }

  func updateCurrentPage() {
    currentPage += 1
    pageRequestEnd = true
  }

  func getCurrentPage() -> Int {
    return currentPage
  }

  func getRequestPageIndex(with paginationType: PaginationType) -> Int {
    switch paginationType {
    case .initial:
      return 1
    case .next:
      return self.getCurrentPage() + 1
    }
  }
}
