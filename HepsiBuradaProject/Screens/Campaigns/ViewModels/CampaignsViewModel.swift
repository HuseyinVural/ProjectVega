//
//  CampaignsViewModel.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class CampaignsViewModel: CampaignsViewModelable {

  var datasourceChanged: (() -> Void)?
  var dataSource: [CampaingsModel] = [] {
    didSet {
      self.datasourceChanged?()
    }
  }

  private let responseHandler: APIResponseHandlable
  private let errorLoger: ErrorLoggable

  init(responseHandler: APIResponseHandlable, errorLoger: ErrorLoggable) {
    self.responseHandler = responseHandler
    self.errorLoger = errorLoger
  }

  var networkMediator: NetworkMediator<CampaignsAPI> {
    let apiResponseMapper = APIResponseMapper(apiResponseHandler: responseHandler, errorLogger: errorLoger)
    return NetworkMediator(apiProvider: MoyaProvider<CampaignsAPI>(), apiResponseMapper: apiResponseMapper)
  }

  lazy var pager: Pageable = {
    let parser = Parser()
    return Pager(viewModel: self, parser: parser, networkMediator: networkMediator)
  }()

}

//Mangable
extension CampaignsViewModel {
  func setDataSource(data: [CampaingsModel]){
    self.dataSource.append(contentsOf: data)
  }

  func clearDataSource(){
    self.dataSource.removeAll()
  }
}


//Listable
extension CampaignsViewModel {
  func numberOfRows(in section: Int) -> Int {
    return dataSource.count
  }

  func viewModel(for indexPath: IndexPath) -> CampaingsModel {
    return dataSource[indexPath.row]
  }
}
