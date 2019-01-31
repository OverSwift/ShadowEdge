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
  
  private var value: UInt
  
  public init(rawValue: UInt){
    value = rawValue
  }
  
  public var rawValue: UInt {
    return value
  }
  
  public static let top: UIShadowEdge = UIShadowEdge(rawValue: 1 << 0)
  public static let right: UIShadowEdge = UIShadowEdge(rawValue: 1 << 1)
  public static let bottom: UIShadowEdge = UIShadowEdge(rawValue: 1 << 2)
  public static let left: UIShadowEdge = UIShadowEdge(rawValue: 1 << 3)
  public static let all: UIShadowEdge = [.top, .bottom, .right, .left]
}
