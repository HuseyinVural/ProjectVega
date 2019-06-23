//
//  CampaingsDelegateTest.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import HepsiBuradaProject

class CampaingsDelegateTest: XCTestCase {
  func test_WhenCallNextPageWithCorrectIndex_ThenPageIsCalling(){
    //Given
    let viewModel = MockListableDataSource()
    viewModel.datasource = []
    for _ in 1...20 {
      viewModel.datasource.append(CampaingStubber.makeCampaing())
    }
    let pager = MockPager()
    let datasource = MockDataSource(viewModel: viewModel)
    let delegate = CampaingsDelegate(pager: pager)

    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
    tableView.dataSource = datasource
    tableView.reloadData()
    tableView.delegate = delegate

    //When
    delegate.callNextPage(tableView, forRowAt: IndexPath(row: 16, section: 0))

    //Then
    pager.verfiy(expected: 1, paginationType: .next)
  }

  func test_WhenCallNextPageWithWrongIndex_ThenPageIsNotCalling(){
    //Given
    let viewModel = MockListableDataSource()
    viewModel.datasource = []
    for _ in 1...20 {
      viewModel.datasource.append(CampaingStubber.makeCampaing())
    }
    let pager = MockPager()
    let datasource = MockDataSource(viewModel: viewModel)
    let delegate = CampaingsDelegate(pager: pager)

    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
    tableView.dataSource = datasource
    tableView.reloadData()
    tableView.delegate = delegate

    //When
    delegate.callNextPage(tableView, forRowAt: IndexPath(row: 10, section: 0))

    //Then
    pager.verfiy(expected: 0, paginationType: .next)
  }
}

