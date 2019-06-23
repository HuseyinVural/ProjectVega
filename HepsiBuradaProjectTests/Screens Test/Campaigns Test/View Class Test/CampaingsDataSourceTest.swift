//
//  CampaingsDataSourceTest.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import HepsiBuradaProject

class CampaingsDataSourceTest: XCTestCase {

  func test_NumberOfRowsInSections_WithViewModelData() {
    let viewModel = MockListableDataSource()
    viewModel.datasource = [CampaingStubber.makeCampaing(), CampaingStubber.makeCampaing()]
    let datasource = CampaingsDataSource(viewModel: viewModel)
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
    let value = datasource.tableView(tableView, numberOfRowsInSection: 0)
    XCTAssertEqual(value, 2, "NumberOfSections not correct.")
  }

  func test_NumberOfRows_WithViewModelData() {
    let viewModel = MockListableDataSource()
    viewModel.datasource = [CampaingStubber.makeCampaing(), CampaingStubber.makeCampaing()]
    let datasource = CampaingsDataSource(viewModel: viewModel)
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
    let id = CampaingsCell.identifier()
    let cell = UINib(nibName: id, bundle: nil)
    tableView.register(cell, forCellReuseIdentifier: id)
    let indexPath = IndexPath(row: 0, section: 0)
    let value = datasource.tableView(tableView, cellForRowAt: indexPath)
    viewModel.verfiyViewModelGetCall(expected: 1, model: viewModel.datasource.first!)
    XCTAssert(value is BaseTableViewCell, "Cell type is not correct")
  }
}

class MockListableDataSource: DataListable {
  var datasource: [CampaingsModel] = []
  var viewModelCallCount = 0
  var lastCreatedViewModel: CampaingsModel?
  func numberOfRows(in section: Int) -> Int {
    return datasource.count
  }

  func viewModel(for indexPath: IndexPath) -> CampaingsModel {
    viewModelCallCount += 1
    lastCreatedViewModel = datasource[indexPath.row]
    return lastCreatedViewModel!
  }

  func verfiyViewModelGetCall(expected callCount: Int, model: CampaingsModel, file: StaticString = #file, line: UInt = #line){
    XCTAssertEqual(self.viewModelCallCount, callCount, "ViewModel get call Wrong call count", file: file, line: line)
    XCTAssertEqual(self.lastCreatedViewModel, model, "Model is not correct", file: file, line: line)
  }
}
