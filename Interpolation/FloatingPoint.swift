//
//  FloatingPoint.swift
//  Interpolation
//
//  Created by Christian Otkjær on 24/10/2017.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

public extension FloatingPoint
{
    static func lerp (a: Self, b: Self, t: Self) -> Self
    {
        return (a * (1 - t) + b * t)
    }
}

/** Linear interpolation between two floating-point values. Using the precise method
 - parameter a: the lower end - lerp(a,b,0) == a
 - parameter b: the upper end - lerp(a,b,1) == b
 - parameter t: the "time", should be in [0;1], but over-/under-shooting can be desired in certain situations
 - returns: interpolation of a and b by t (a * (1 - t) + b * t)
 */
@inline(__always)
public func lerp<F: FloatingPoint> (_ a: F, _ b: F, _ t: F) -> F
{
    return (a * (1 - t) + b * t)
}


extension Double: Interpolatable
{
    public typealias InterpolationFactor = Double
    public typealias InterpolationResult = Double
}

extension Float: Interpolatable
{
    public typealias InterpolationFactor = Float
    public typealias InterpolationResult = Float
}

extension CGFloat: Interpolatable
{
    public typealias InterpolationFactor = CGFloat
    public typealias InterpolationResult = CGFloat
}
