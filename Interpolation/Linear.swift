//
//  Linear.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public func linearInterpolate<I:Interpolatable>(a: I, _ b: I, _ f: I.InterpolationFactor) -> I
{
    return a * (1 - f) + b * f
}
