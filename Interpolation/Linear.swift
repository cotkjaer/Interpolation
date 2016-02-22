//
//  Linear.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol BaseLinearInterpolatable: FloatingPointType, IntegerLiteralConvertible
{
    static func * (lhs: Self, rhs: Self) -> Self
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
}

extension Double : BaseLinearInterpolatable {}
extension CGFloat : BaseLinearInterpolatable {}
extension Float : BaseLinearInterpolatable {}


/// LERP operator (◊ made with alt-shift-v)
infix operator ◊ { associativity left precedence 160 }

/// Basic linear interpolation between two floating-point values
public func ◊ <I: BaseLinearInterpolatable> (ab: (I,I), t: I) -> I
{
    return ab.0 * (1 - t) + ab.1 * t
}

/*public protocol LinearInterpolatable : Interpolatable
{
    typealias InterpolationFactor
    
    /// InterpolationResult is needed to support non-final classes, as they cannot implement functions returning Self
    typealias InterpolationResult
    
    @warn_unused_result
    func linearInterpolatedWith(b: Self, _ f: InterpolationFactor) -> Self.InterpolationResult

    @warn_unused_result
    static func ◊ (ab: (Self, Self), f: Self.InterpolationFactor) -> Self.InterpolationResult

    @warn_unused_result
    static func lerp (a: Self, _ b: Self, _ t: Self.InterpolationFactor) -> Self.InterpolationResult
}

// MARK: - Default

extension LinearInterpolatable
{
    @warn_unused_result
    public func linearInterpolatedWith(b: Self, _ f: InterpolationFactor) -> Self.InterpolationResult
    {
        return (self, b) ◊ f
    }
}

/// LERP operator (◊ made with alt-shift-v)
infix operator ◊ { associativity left precedence 160 }


public func ◊ <I: LinearInterpolatable> (ab: (I,I), t: I.InterpolationFactor) -> I.InterpolationResult
{
    return I.lerp(ab.0, ab.1, t)
}

public func lerp <I: LinearInterpolatable> (a: I, _ b: I, _ t: I.InterpolationFactor) -> I.InterpolationResult
{
    return (a,b) ◊ t
//    return I.interpolate(a, b, t)
}

public func ◊ <I1: LinearInterpolatable, I2: LinearInterpolatable where I1.InterpolationFactor == I2.InterpolationFactor> (ab: ((I1,I2),(I1,I2)), t: I1.InterpolationFactor) -> (I1.InterpolationResult,I2.InterpolationResult)
{
    return ((ab.0.0, ab.1.0) ◊ t, (ab.0.1, ab.1.1) ◊ t)
}

public func lerp <I1: LinearInterpolatable, I2: LinearInterpolatable where I1.InterpolationFactor == I2.InterpolationFactor> (a: (I1,I2), _ b: (I1,I2), _ t: I1.InterpolationFactor) -> (I1.InterpolationResult,I2.InterpolationResult)
{
    return ((a.0, b.0) ◊ t, (a.1, b.1) ◊ t)
//    return (I1.interpolate(a.0, b.0, t), I2.interpolate(a.1, b.1, t))
}

 /*
    
    static func * (i: Self, f: InterpolationFactor) -> Self
    
    static func + (lhs: Self, rhs: Self) -> Self
}

public protocol LinearInterpolatable //: FloatingPointArithmeticType
{
    typealias InterpolationFactor

    static func ◊ (lhs: Self, rhs: (Self, Self.InterpolationFactor)) -> Self
}

infix operator ◊ { associativity left precedence 160 }

@warn_unused_result
public func ◊ <F: LinearInterpolatable>(lhs: F, rhs: (F, F.InterpolationFactor)) -> F { return lhs }

infix operator ◊= { associativity right precedence 90 }

public func ◊=  <F: LinearInterpolatable>(inout lhs: F, rhs: (F, F.InterpolationFactor)) { lhs = lhs ◊ rhs }

public func linearInterpolate<I:Interpolatable>(a: I, _ b: I, _ f: I.InterpolationFactor) -> I
{
    return a * (1 - f) + b * f
}

*/


*/
