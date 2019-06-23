//
//  CampaingsCell.swift
//  HepsiBuradaProject
//
//  Created by Hüseyin Vural on 22.06.2019.
//  Copyright © 2019 Hüseyin Vural. All rights reserved.
//

import UIKit
import Kingfisher

class CampaingsCell: BaseTableViewCell {

  @IBOutlet var imageHeightConstraint: NSLayoutConstraint!
  @IBOutlet var coverImge: UIImageView!
  @IBOutlet var canpaingsTitle: UILabel!
  @IBOutlet var date: UILabel!


  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }

  override func configure(data: Any, indexPath: IndexPath) {
    guard let data = data as? CampaingsModel else {
      fatalError("Cell view model not convertable.")
    }

    self.canpaingsTitle.text = data.title+" #\(indexPath.row) "
    self.date.text = data.expirationDate
    self.imageHeightConstraint.constant = data.calcultedHeight
    self.coverImge.kf.setImage(with: URL(string: data.image.url))
  }
}
