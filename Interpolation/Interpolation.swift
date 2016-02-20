//
//  Interpolation.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public protocol Interpolatable
{
    typealias InterpolationFactor : IntegerLiteralConvertible,IntegerArithmeticType
    
    static func * (i: Self, f: InterpolationFactor) -> Self

    static func + (lhs: Self, rhs: Self) -> Self
}

public func interpolate<I:Interpolatable>(a: I, _ b: I, _ f: I.InterpolationFactor, function: ((I, I, I.InterpolationFactor) -> I) = linearInterpolate/*{ $0 * (1 - $2) + $1 * $2 }*/) -> I
{
    return function(a, b, f)
}

// MARK: - Double

extension Double : IntegerArithmeticType
{
    public static func addWithOverflow(lhs: Double, _ rhs: Double) -> (Double, overflow: Bool)
    {
        return (lhs &+ rhs, lhs + rhs != lhs &+ rhs)
    }

    public static func subtractWithOverflow(lhs: Double, _ rhs: Double) -> (Double, overflow: Bool)
    {
        return (lhs &- rhs, lhs - rhs != lhs &- rhs)
    }
    
    public static func multiplyWithOverflow(lhs: Double, _ rhs: Double) -> (Double, overflow: Bool)
    {
        return (lhs &* rhs, lhs * rhs != lhs &* rhs)
    }
    
    public static func divideWithOverflow(lhs: Double, _ rhs: Double) -> (Double, overflow: Bool)
    {
        return (lhs / rhs, false)
    }
    
    public static func remainderWithOverflow(lhs: Double, _ rhs: Double) -> (Double, overflow: Bool)
    {
        return (lhs % rhs, false)
    }
    
    public func toIntMax() -> IntMax
    {
        return IntMax(self)
    }
}

extension Double : Interpolatable
{
    public typealias InterpolationFactor = Double
}

// MARK: - Float

extension Float : IntegerArithmeticType
{
    public static func addWithOverflow(lhs: Float, _ rhs: Float) -> (Float, overflow: Bool)
    {
        return (lhs &+ rhs, lhs + rhs != lhs &+ rhs)
    }
    
    public static func subtractWithOverflow(lhs: Float, _ rhs: Float) -> (Float, overflow: Bool)
    {
        return (lhs &- rhs, lhs - rhs != lhs &- rhs)
    }
    
    public static func multiplyWithOverflow(lhs: Float, _ rhs: Float) -> (Float, overflow: Bool)
    {
        return (lhs &* rhs, lhs * rhs != lhs &* rhs)
    }
    
    public static func divideWithOverflow(lhs: Float, _ rhs: Float) -> (Float, overflow: Bool)
    {
        return (lhs / rhs, false)
    }
    
    public static func remainderWithOverflow(lhs: Float, _ rhs: Float) -> (Float, overflow: Bool)
    {
        return (lhs % rhs, false)
    }
    
    public func toIntMax() -> IntMax
    {
        return IntMax(self)
    }
}

extension Float : Interpolatable
{
    public typealias InterpolationFactor = Float
}
