//
//  Interpolatable.swift
//  Interpolation
//
//  Created by Christian Otkjær on 25/10/2017.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

/** Protocol representing an object that can be interpolated with other objects of the same type
 */
public protocol Interpolatable
{
    associatedtype InterpolationFactor: FloatingPoint
    
    /** The associated type for the result of interpolating two objects. Essentially always the class/struct implementing he protocol.
     */
    associatedtype InterpolationResult
    
    /** Linear interpolation between two interpolatable values
    - parameter a: the lower end - lerp(a,b,0) == a
    - parameter b: the upper end - lerp(a,b,1) == b
    - parameter t: the "time", is supposed to be in [0;1], but over-/under-shooting can be desired in certain situations
    - returns: interpolation of a and b by t
     */
    static func lerp (a: Self, b: Self, t: InterpolationFactor) -> InterpolationResult
}
