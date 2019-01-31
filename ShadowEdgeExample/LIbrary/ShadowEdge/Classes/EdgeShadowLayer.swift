//
//  EdgeShadowLayer.swift
//  ShadowEdge
//
//  Created by Sergiy Loza on 26.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import Foundation

public protocol EdgeShadowView {
  
  var shadowLayer: EdgeShadowLayer { get }
  var shadowEdge: UIShadowEdge { get set }
}

public extension EdgeShadowView where Self:UIView {
  
  var shadowLayer: EdgeShadowLayer {
    get {
      return self.layer as! EdgeShadowLayer
    }
  }
}

public extension EdgeShadowView {
  
  var shadowEdge: UIShadowEdge {
    set {
      self.shadowLayer.edge = newValue
    } get {
      return self.shadowLayer.edge
    }
  }
}

public class EdgeShadowLayer: CAShapeLayer {
  
  private var maskLayer: CAShapeLayer = CAShapeLayer()
  public var edge: UIShadowEdge = [.all]
  public var corner: UIRectCorner?
  
  override init() {
    super.init()
    shadowOffset = CGSize(width: 0, height: 0)
    self.fillColor = UIColor.white.cgColor
  }
  
  override init(layer: Any) {
    guard let other = layer as? EdgeShadowLayer else {
      super.init()
      return
    }
    self.edge = other.edge
    self.corner = other.corner
    super.init()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func layoutSublayers() {
    super.layoutSublayers()
    update()
    
    guard let subs = sublayers else { return }
    
    subs.forEach { (sub) in
      let mask = CAShapeLayer()
      mask.path = self.path
      sub.mask = mask
    }
  }
  
  private func update() {
    
    defer {
      updateMask()
    }
    
    guard let corner = corner else {
      path = UIBezierPath(rect: self.bounds).cgPath
      return
    }
    self.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
  }
  
  private func updateMask() {
    print("Update mask")
    var maskFrame = self.bounds
    var shadowFrame = self.bounds
    
    if edge.contains(.top) {
      maskFrame.origin.y -= (self.shadowRadius * 10)
      maskFrame.size.height += self.shadowRadius * 10
    }
    
    if edge.contains(.left) {
      maskFrame.origin.x -= (self.shadowRadius * 10)
      maskFrame.size.width += self.shadowRadius * 10
    }
    
    if edge.contains(.right) {
      maskFrame.size.width += self.shadowRadius * 10
    }
    
    if edge.contains(.bottom) {
      maskFrame.size.height += self.shadowRadius * 10
    }
    
    if edge.contains(.right) && edge.contains(.left) {
      if !edge.contains(.top) {
        shadowFrame.origin.y -= self.shadowRadius * 2
      }
      if !edge.contains(.bottom) {
        shadowFrame.size.height += self.shadowRadius * 4
      } else {
        shadowFrame.size.height += self.shadowRadius * 2
      }
    }
    
    self.shadowPath = UIBezierPath(rect: shadowFrame).cgPath
    
    let path = UIBezierPath(roundedRect: maskFrame, cornerRadius: cornerRadius).cgPath
    self.maskLayer.path = path
    self.mask = maskLayer
  }
}
