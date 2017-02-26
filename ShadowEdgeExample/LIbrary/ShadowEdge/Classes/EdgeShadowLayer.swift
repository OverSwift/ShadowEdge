//
//  EdgeShadowLayer.swift
//  ShadowEdge
//
//  Created by Sergiy Loza on 26.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import Foundation

public class EdgeShadowLayer: CAShapeLayer {
  
  private var maskLayer: CAShapeLayer = CAShapeLayer()
  
  public var edge:UIShadowEdge = [.allEdges] {
    didSet {
      self.setNeedsLayout()
    }
  }
  
  public var corner:UIRectCorner = .allCorners {
    didSet {
      self.setNeedsLayout()
    }
  }
  
  override public var cornerRadius: CGFloat {
    didSet {
      self.setNeedsLayout()
    }
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func layoutSublayers() {
    super.layoutSublayers()
    update()
  }
  
  private func update() {
    self.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
    updateMask()
  }
  
  private func updateMask() {
    
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
