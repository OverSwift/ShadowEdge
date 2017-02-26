//
//  UIShadowSide.swift
//  ShadowEdge
//
//  Created by Sergiy Loza on 26.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import Foundation

public struct UIShadowEdge : OptionSet {
  
  public typealias RawValue = UInt
  
  private var value:UInt
  
  public init(rawValue: UInt){
    value = rawValue
  }
  
  public var rawValue: UInt {
    return value
  }
  
  public static let topEdge: UIShadowEdge = UIShadowEdge(rawValue: 1 << 0)
  public static let rightEdge: UIShadowEdge = UIShadowEdge(rawValue: 1 << 1)
  public static let bottomEdge: UIShadowEdge = UIShadowEdge(rawValue: 1 << 2)
  public static let leftEgge: UIShadowEdge = UIShadowEdge(rawValue: 1 << 3)
  public static let allEdges: UIShadowEdge = UIShadowEdge.topEdge.union(UIShadowEdge.rightEdge).union(UIShadowEdge.bottomEdge).union(UIShadowEdge.leftEgge)
}
