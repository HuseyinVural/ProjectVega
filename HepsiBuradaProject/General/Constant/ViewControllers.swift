//
//  ViewControllers.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

struct ViewControllers {
  enum Identifier: String {
    case campings = "CampaignsViewController"
  }

  static func make(with identifier: String, from storyboard: UIStoryboard) -> UIViewController? {
    return storyboard.instantiateViewController(withIdentifier: identifier)
  }

  @discardableResult
  static func defineViewController<T: UIViewController>(with identifier: String,
                                                        from storyboard: UIStoryboard,
                                                        of type: T.Type? = nil) -> T {

    guard let viewController = make(with: identifier, from: storyboard) as? T else {
      fatalError("Could not define view controller with identifier: \(identifier), from storyboard: \(storyboard)")
    }
    return viewController
  }

  static var campaignsViewController: CampaignsViewController {
    return defineViewController(with: Identifier.campings.rawValue, from: Storyboards.campaigns)
  }
}
