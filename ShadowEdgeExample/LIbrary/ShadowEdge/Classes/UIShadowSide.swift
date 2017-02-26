//
//  UIShadowSide.swift
//  ShadowEdge
//
//  Created by Sergiy Loza on 26.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import Foundation

public struct UIShadowSide : OptionSet {
  
  public typealias RawValue = UInt
  private var value:UInt
  public init(rawValue: UInt){
    value = rawValue
  }
  
  public var rawValue: UInt {
    return value
  }
  
  public static let topEdge: UIShadowSide = UIShadowSide(rawValue: 1 << 0)
  public static let rightEdge: UIShadowSide = UIShadowSide(rawValue: 1 << 1)
  public static let bottomEdge: UIShadowSide = UIShadowSide(rawValue: 1 << 2)
  public static let leftEgge: UIShadowSide = UIShadowSide(rawValue: 1 << 3)
  public static let allEdges = UIShadowSide.topEdge.union(UIShadowSide.rightEdge).union(UIShadowSide.bottomEdge).union(UIShadowSide.leftEgge)
}
