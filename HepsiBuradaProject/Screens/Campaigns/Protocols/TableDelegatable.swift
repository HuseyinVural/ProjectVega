//
//  TableDelegatable.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 23.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

protocol TableDelegatable: UITableViewDelegate {
  var pager: Pageable { get set }
}
