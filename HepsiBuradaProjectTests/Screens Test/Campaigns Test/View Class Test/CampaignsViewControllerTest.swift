//
//  CampaignsViewControllerTest.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import XCTest
import Moya
import Result
@testable import HepsiBuradaProject

class CampaignsViewControllerTest: XCTestCase {

  func test_WhenCallViewDidLoad_ThenCallInitalPage() {
    let pager = MockPager()
    let apiResponseMapper = MockAPIResponseMapper()
    let networkMediator = NetworkMediator(apiProvider: MoyaProvider<CampaignsAPI>(), apiResponseMapper: apiResponseMapper)
    let viewModel = MockViewModel(networkMediator: networkMediator, pager: pager)
    let datasource = MockDataSource(viewModel: viewModel)
    let delegate = MockListableDelegate(pager: pager)
    let viewController = ViewControllers.campaignsViewController
    viewController.viewModel = viewModel
    viewController.datasource = datasource
    viewController.delegate = delegate
    viewController.viewDidLoad()
    pager.verfiy(expected: 1, paginationType: .initial)
  }

}

class MockViewModel: CampaignsViewModelable {
  var pager: Pageable

  var datasourceChanged: (() -> Void)?

  var networkMediator: NetworkMediator<CampaignsAPI>

  init(networkMediator: NetworkMediator<CampaignsAPI>, pager: Pageable) {
    self.networkMediator = networkMediator
    self.pager = pager
  }

  func setDataSource(data: [CampaingsModel]) {

  }

  func clearDataSource() {

  }

  func numberOfRows(in section: Int) -> Int {
    return 1
  }

  func viewModel(for indexPath: IndexPath) -> CampaingsModel {
    return CampaingStubber.makeCampaing()
  }
}


class MockListableDelegate: NSObject, TableDelegatable {
  var pager: Pageable

  init(pager: Pageable) {
    self.pager = pager
  }
}

class MockPager: Pageable {
  var getCampaignsCallCount = 0
  var lastPaginationType: PaginationType = .next

  func getCampaigns(with paginationType: PaginationType) {
    getCampaignsCallCount += 1
    lastPaginationType = paginationType
  }

  func verfiy(expected callCount: Int, paginationType: PaginationType, file: StaticString = #file, line: UInt = #line){
    XCTAssertEqual(self.getCampaignsCallCount, callCount, "getCampaigns Wrong call count", file: file, line: line)
    XCTAssertEqual(self.lastPaginationType, paginationType, "paginationType not correct", file: file, line: line)
  }
}

class MockDataSource: NSObject, UITableViewDataSource {
  var viewModel: DataListable

  init(viewModel: DataListable) {
    self.viewModel = viewModel
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows(in: section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
