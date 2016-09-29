//
//  Linear.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol BaseLinearInterpolatable: FloatingPoint, ExpressibleByIntegerLiteral
{
    static func * (lhs: Self, rhs: Self) -> Self
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
}


/// LERP operator (◊ made with alt-shift-v)
infix operator ◊ : MultiplicationPrecedence //{ associativity left precedence 160 }

/// Basic linear interpolation between two floating-point values
public func ◊ <I: BaseLinearInterpolatable> (ab: (I,I), t: I) -> I
{
    return ab.0 * (1 - t) + ab.1 * t
}

/// Basic linear interpolation between X floating-point values (result will be of length `values.count - 1`)
public func ◊ <I: BaseLinearInterpolatable> (values: [I], t: I) -> [I]
{
    let lastIndex = values.endIndex - 1
    
    guard lastIndex > 0 else { debugPrint("Cannot LERP an array of less than 2 values"); return [] }
    
    var result = Array<I>(repeating: 0, count: lastIndex)
    
    for index in 0..<lastIndex
    {
        result[index] = (values[index], values[index + 1]) ◊ t
    }
    
    return result
}

/// Basic linear interpolation between X floating-point values and X-1 times (result will be of length `values.count - 1`)
public func ◊ <I: BaseLinearInterpolatable> (values: [I], t: [I]) -> [I]
{
    let lastIndex = values.endIndex - 1
    
    guard t.endIndex >= lastIndex else { debugPrint("Too few t's"); return [] }
    
    guard lastIndex > 0 else { debugPrint("Cannot LERP an array of less than 2 values"); return [] }
    
    var result = Array<I>(repeating: 0, count: lastIndex)
    
    for index in 0..<lastIndex
    {
        result[index] = (values[index], values[index + 1]) ◊ t[index]
    }
    
    return result
}

