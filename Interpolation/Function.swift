//
//  Function.swift
//  Interpolation
//
//  Created by Christian Otkjær on 25/10/2017.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//


/** Linear interpolation between two interpolatable values
 - parameter a: the lower end
 - parameter b: the upper end
 - parameter t: the "time", is supposed to be in [0;1], but over-/under-shooting can be desired in certain situations
 - returns: interpolation of a and b by t
 */
@inline(__always)
public func lerp<I: Interpolatable> (a: I, b: I, t: I.InterpolationFactor) -> I.InterpolationResult
{
    return I.lerp(a: a, b: b, t: t)
}

/** Basic linear interpolation between two sequences of interpolatable values.
 - parameter a: the sequence of lower end of the interpolated range
 - parameter b: the sequence of upper end of the interpolated range
 - parameter t: the "time", should be in [0;1], but over-/under-shooting can be desired in certain situations
 - returns: An Array of as and bs interpolated by t
 - note: a and b must have the same number of elements
 */
public func lerp<S: Sequence> (_ a: S, _ b: S, _ t: S.Element.InterpolationFactor) -> [S.Element.InterpolationResult] where S.Element: Interpolatable
{
    return zip(a, b).map({ $0 ◊ t })
}

/** Basic linear interpolation between elements in an array of interpolatable values.
 - parameter a: the array of interpolatables
 - parameter t: the "time", should be in [0;1], but over-/under-shooting can be desired in certain situations
 - returns: interpolation of a[i] and a[i+1] by t for i in [a.startIndex..<a.endIndex - 1]
 */
public func lerp<S: Sequence> (_ s: S, _ t: S.Element.InterpolationFactor) -> [S.Element.InterpolationResult] where S.Element: Interpolatable
{
    var last: S.Element?

    return s.flatMap { (current) -> S.Element.InterpolationResult? in

        defer { last = current }
        
        guard let first = last else { return nil }
        
        return lerp(a: first, b: current, t: t)
    }
}
