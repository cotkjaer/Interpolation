//
//  CGPoint.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import CoreGraphics

extension CGPoint: Interpolatable
{
    public typealias InterpolationFactor = CGFloat
    public typealias InterpolationResult = CGPoint
    
    public static func lerp(a: CGPoint, b: CGPoint, t: CGFloat) -> CGPoint
    {
        return CGPoint(
            x: CGFloat.lerp(a: a.x, b: b.x, t: t),
            y: CGFloat.lerp(a: a.y, b: b.y, t: t)
        )
    }
}
