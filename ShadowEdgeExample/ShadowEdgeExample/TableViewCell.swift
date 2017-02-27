//
//  TableViewCell.swift
//  ShadowEdgeExample
//
//  Created by Sergiy Loza on 26.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import UIKit
import ShadowEdge

class TableViewCell: UITableViewCell, EdgeShadowView {
  
  override class var layerClass: Swift.AnyClass {
    return EdgeShadowLayer.self
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.shadowLayer.cornerRadius = 10
    self.shadowLayer.shadowColor = UIColor.green.cgColor
    self.shadowLayer.shadowOpacity = 1.0
    self.shadowLayer.masksToBounds = false
    self.shadowLayer.shadowRadius = 12
    self.shadowLayer.cornerRadius = 10
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
