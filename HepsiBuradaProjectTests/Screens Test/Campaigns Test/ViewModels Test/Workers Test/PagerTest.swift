//
//  PagerTest.swift
//  HepsiBuradaProjectTests
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import XCTest
import Foundation
@testable import HepsiBuradaProject
import Moya
import Result

class PagerTest: XCTestCase {
  func test_WhenGetCampaignsWithInitalPageType_ThenCallNecessaryMethodes(){
    let apiResponseMapper = MockAPIResponseMapper()
    let viewModel = MockDataManagbleViewModel()
    viewModel.lastData = [CampaingStubber.makeCampaing(),CampaingStubber.makeCampaing()]
    let parser = MockParser()
    let networkMediator = NetworkMediator(apiProvider: MoyaProvider<CampaignsAPI>(), apiResponseMapper: apiResponseMapper)
    let pager = Pager(viewModel: viewModel, parser: parser, networkMediator: networkMediator)
    pager.getCampaigns(with: .initial)
    viewModel.verfiyClearDataSource(expected: 1, data: [])
    XCTAssert(!pager.pageRequestEnd, "Page request state not changed.")
  }

  func test_WhenUpdateCurrentPage_ThenChangeCurrentPageAndRequestState(){
    let apiResponseMapper = MockAPIResponseMapper()
    let viewModel = MockDataManagbleViewModel()
    let parser = MockParser()
    let networkMediator = NetworkMediator(apiProvider: MoyaProvider<CampaignsAPI>(), apiResponseMapper: apiResponseMapper)
    let pager = Pager(viewModel: viewModel, parser: parser, networkMediator: networkMediator)
    pager.pageRequestEnd = false
    pager.currentPage = 0
    pager.updateCurrentPage()
    XCTAssertEqual(pager.pageRequestEnd, true, "PageRequestEnd status should be updated")
    XCTAssertEqual(pager.currentPage, 1, "Page Number status should be updated")
  }

  func test_WhenCallCurrentPageMethode_ThenCorrectPageNumberIsReturned(){
    let apiResponseMapper = MockAPIResponseMapper()
    let viewModel = MockDataManagbleViewModel()
    let parser = MockParser()
    let networkMediator = NetworkMediator(apiProvider: MoyaProvider<CampaignsAPI>(), apiResponseMapper: apiResponseMapper)
    let pager = Pager(viewModel: viewModel, parser: parser, networkMediator: networkMediator)
    pager.currentPage = 1123
    XCTAssertEqual(pager.getCurrentPage(), 1123, "Page number is not correct")
  }

  func test_WhenCallGetRequestPageIndex_ThenCorrectPageNumberIsReturned(){
    let apiResponseMapper = MockAPIResponseMapper()
    let viewModel = MockDataManagbleViewModel()
    let parser = MockParser()
    let networkMediator = NetworkMediator(apiProvider: MoyaProvider<CampaignsAPI>(), apiResponseMapper: apiResponseMapper)
    let pager = Pager(viewModel: viewModel, parser: parser, networkMediator: networkMediator)
    pager.currentPage = 123
    let initalPageValue = pager.getRequestPageIndex(with: .initial)
    XCTAssertEqual(initalPageValue, 1, "Page number is not correct")
    let nextPageValue = pager.getRequestPageIndex(with: .next)
    XCTAssertEqual(nextPageValue, 124, "Page number is not correct")
  }

  func test_WhenGetCheckInitalPage_ThenClearDataSource(){
    let apiResponseMapper = MockAPIResponseMapper()
    let viewModel = MockDataManagbleViewModel()
    viewModel.lastData = [CampaingStubber.makeCampaing(),CampaingStubber.makeCampaing()]
    let parser = MockParser()
    let networkMediator = NetworkMediator(apiProvider: MoyaProvider<CampaignsAPI>(), apiResponseMapper: apiResponseMapper)
    let pager = Pager(viewModel: viewModel, parser: parser, networkMediator: networkMediator)
    pager.getCampaigns(with: .initial)
    viewModel.verfiyClearDataSource(expected: 1, data: [])
  }
}

class MockAPIResponseMapper: APIResponseMappable {
  func map<DecodableObject>(_ result: Result<Response, MoyaError>, of type: DecodableObject.Type, _ response: @escaping (APIResult<DecodableObject>) -> Void) where DecodableObject : Decodable {

  }
}

class MockDataManagbleViewModel: DataManagble {
  var setDataSourceCallCount = 0
  var lastData: [CampaingsModel] = []
  var clearDataSourceCallCount = 0

  func setDataSource(data: [CampaingsModel]) {
    setDataSourceCallCount += 1
    lastData.append(contentsOf: data)
  }

  func clearDataSource() {
    clearDataSourceCallCount += 1
    lastData.removeAll()
  }

  func verfiySetDataSource(expected callCount: Int, data: [CampaingsModel], file: StaticString = #file, line: UInt = #line){
    XCTAssertEqual(self.setDataSourceCallCount, callCount, "setDataSourceCallCount Wrong call count", file: file, line: line)
    XCTAssertEqual(self.lastData, data, "setDataSourceCallCount data not correct", file: file, line: line)
  }

  func verfiyClearDataSource(expected callCount: Int, data: [CampaingsModel], file: StaticString = #file, line: UInt = #line){
    XCTAssertEqual(self.clearDataSourceCallCount, callCount, "clearDataSourceCallCount Wrong call count", file: file, line: line)
  }
}

class MockParser: Parsable {
  var parseCallCount = 0
  func parse(pureModel: CampaingsResponseModel) -> [CampaingsModel] {
    parseCallCount += 1
    return []
  }
}
