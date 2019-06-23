//
//  CampaignsViewModelTest.swift
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

class CampaignsViewModelTest: XCTestCase {

  var viewModel: CampaignsViewModel {
    let errorLoger = MockErrorLogger()
    let responseHadnler = MockApiResponseHandler()
    let viewModel = CampaignsViewModel(responseHandler: responseHadnler, errorLoger: errorLoger)
    return viewModel
  }

  func test_WhenChangeDataSource_ThenIsTriggerDataClousre(){
    let viewModel = self.viewModel
    var clousreCallCount: Int = 0
    viewModel.datasourceChanged = { ()-> Void in
      clousreCallCount += 1
    }
    viewModel.dataSource = [CampaingStubber.makeCampaing()]

    XCTAssertEqual(clousreCallCount, 1, "Clousre bind problem.")
  }

  func test_WhenUseSetDataSourceMethode_ThenAddingIsSendedData(){
    let viewModel = self.viewModel
    let newModels = [CampaingStubber.makeCampaing(),CampaingStubber.makeCampaing()]
    viewModel.setDataSource(data: newModels)

    XCTAssertEqual(viewModel.dataSource.count, newModels.count, "Data soure models count not correct.")
  }

  func test_WhenUserClearDatasourceMethode_ThenEmptyDatasourceIsReturned(){
    let viewModel = self.viewModel
    viewModel.dataSource = [CampaingStubber.makeCampaing(),CampaingStubber.makeCampaing()]
    viewModel.clearDataSource()

    XCTAssert(viewModel.dataSource.isEmpty, "Data is not empty.")
  }

  func test_WhenGetNumberOfRow_ThenCorrectIsReturned(){
    let viewModel = self.viewModel
    let newModels = [CampaingStubber.makeCampaing(),CampaingStubber.makeCampaing()]
    viewModel.dataSource = newModels
    let rowsCount = viewModel.numberOfRows(in: 0)

    XCTAssertEqual(rowsCount, newModels.count, "numberOfRows methode returned value not correct.")
  }

  func test_WhenGetViewModel_ThenCorrectIsReturned(){
    let viewModel = self.viewModel
    let newModels = [CampaingStubber.makeCampaing(),CampaingStubber.makeCampaing()]
    viewModel.dataSource = newModels
    let indexPath = IndexPath(row: 1, section: 0)
    let returnedModel = viewModel.viewModel(for: indexPath)

    XCTAssertEqual(returnedModel, newModels[1], "numberOfRows methode returned value not correct.")
  }
}

class MockApiResponseHandler: APIResponseHandlable {
  func process<T>(_ result: Result<Response, MoyaError>, ofType type: T.Type, _ errorLogger: ErrorLoggable) -> APIResult<T> where T : Decodable {
    return APIResult.failure(.general(errorMessage: "Mock Fail"))
  }
}

class MockErrorLogger: ErrorLoggable {
  var logCallCounter: Int = 0
  var error: Error? = nil
  var requestURL: String = ""
  func log(_ error: Error, forURL requestURL: String) {
    self.logCallCounter += 1
    self.error = error
    self.requestURL = requestURL
  }

  func verfiy(expected callCount: Int, error: Error, requestURL: String, file: StaticString = #file, line: UInt = #line){
    XCTAssertEqual(self.logCallCounter, callCount, "Error Handler log wrong call count", file: file, line: line)
    XCTAssertEqual(self.error?.localizedDescription, error.localizedDescription, "Error Handler expected error not correct", file: file, line: line)
    XCTAssertEqual(self.requestURL, requestURL, "Error Handler log wrong call count", file: file, line: line)
  }
}
