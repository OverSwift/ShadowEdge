//
//  UIView+RoundedCorners.swift
//  ShadowEdge
//
//  Created by Sergiy Loza on 27.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import UIKit

public extension UIView {
  
  
  /// Round view on specific corner. Use layer cornerRadius property for radius.
  ///
  /// - Parameter corners: corners to round
  public func round(corners: UIRectCorner) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: self.layer.cornerRadius, height: self.layer.cornerRadius))
    let layer = CAShapeLayer()
    layer.path = path.cgPath
    self.layer.mask = layer
  }
}
