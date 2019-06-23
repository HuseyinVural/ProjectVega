//
//  Storyboards.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

struct Storyboards {
  private enum Name: String {
    case main = "Main",
    campaigns = "Campaigns"
  }

  static func makeStoryboard(from name: String, _ bundle: Bundle? = nil) -> UIStoryboard {
    return UIStoryboard(name: name, bundle: bundle)
  }
  static var campaigns: UIStoryboard {
    return makeStoryboard(from: Name.campaigns.rawValue)
  }

  static var main: UIStoryboard {
    return makeStoryboard(from: Name.main.rawValue)
  }
}
