//
//  TableViewCell+Extensions.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
  static func identifier() -> String {
    return String(describing: self)
  }
}
