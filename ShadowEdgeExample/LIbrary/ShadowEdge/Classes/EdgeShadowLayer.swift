//
//  EdgeShadowLayer.swift
//  ShadowEdge
//
//  Created by Sergiy Loza on 26.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import Foundation

class EdgeShadowLayer: CAShapeLayer {
  
  var maskLayer: CAShapeLayer = CAShapeLayer()
  
  var edge:UIShadowSide? = [.allEdges] {
    didSet {
      updateMask()
    }
  }
  
  var corner:UIRectCorner = .allCorners {
    didSet {
      update()
    }
  }
  
  override var cornerRadius: CGFloat {
    didSet {
      update()
    }
  }
  
  override init() {
    super.init()
    update()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSublayers() {
    super.layoutSublayers()
    update()
  }
  
  func update() {
    self.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
    updateMask()
  }
  
  private func updateMask() {
    
    guard let edge = edge else {
      self.mask = nil
      return
    }
    
    var maskFrame = self.bounds
    
    if edge.contains(.topEdge) {
      maskFrame.origin.y -= (self.shadowRadius * 10)
      maskFrame.size.height += self.shadowRadius * 10
    }
    
    if edge.contains(.leftEgge) {
      maskFrame.origin.x -= (self.shadowRadius * 10)
      maskFrame.size.width += self.shadowRadius * 10
    }
    
    if edge.contains(.rightEdge) {
      maskFrame.size.width += self.shadowRadius * 10
    }
    
    if edge.contains(.bottomEdge) {
      maskFrame.size.height += self.shadowRadius * 10
    }
    
    let path = UIBezierPath(roundedRect: maskFrame, cornerRadius: cornerRadius).cgPath
    self.maskLayer.path = path
    self.mask = maskLayer
  }
}
