//
//  Operator.swift
//  Interpolation
//
//  Created by Christian Otkjær on 24/10/2017.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

/** LERP operator (◊ made with alt-shift-v)
 */
infix operator ◊ : MultiplicationPrecedence

/** Basic linear interpolation between two interpolatable values
 - parameter ab: the tuple (a,b) that should be interpolated
 - parameter t: the "time", should be in [0;1]
 - returns: interpolation of a and b by t
 */
public func ◊ <I: Interpolatable> (ab: (a: I, b: I), t: I.InterpolationFactor) -> I.InterpolationResult
{
    return I.lerp(a: ab.a, b: ab.b, t: t)
}


/** Basic linear interpolation between X floating-point values (result will be of length `values.count - 1`)
 - parameter values: the values that should be pairwise interpolated
 - parameter t: the "time", should be in [0;1]
 - returns: interpolated values [(v[0], v[1]) ◊ t, (v[1], v[2]) ◊ t, (v[2], v[3]) ◊ t, ...]
 */
//public func ◊ <I: Interpolatable> (values: [I], t: I.InterpolationFactor) -> [I.InterpolationResult]
//{
//    guard values.count > 1 else { debugPrint("Cannot LERP an array of less than 2 values"); return [] }
//
//    return (values.startIndex..<values.endIndex-1).map({ (index) -> I.InterpolationResult in
//        lerp(a: values[index], b: values[index + 1], t: t)
//    })
//}

public func ◊ <S: Sequence> (sequence: S, t: S.Element.InterpolationFactor) -> [S.Element.InterpolationResult] where S.Element: Interpolatable
{
    return lerp(sequence, t)
}

/// Basic linear interpolation between X floating-point values and X-1 times (result will be of length `values.count - 1`)
public func ◊ <I: Interpolatable> (values: [I], t: [I.InterpolationFactor]) -> [I.InterpolationResult]
{
    guard values.count > 1 else { debugPrint("Cannot LERP an array of less than 2 values"); return [] }
    
    guard t.startIndex == values.startIndex, t.endIndex >= values.endIndex - 1 else { debugPrint("Too few t's"); return [] }
    
    let r = (values.startIndex..<values.endIndex-1)
    
    return r.map({ (index) -> I.InterpolationResult in
        lerp(a: values[index], b: values[index + 1], t: t[index])
    })
}

