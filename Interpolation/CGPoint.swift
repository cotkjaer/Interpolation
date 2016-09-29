//
//  CGPoint.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

/// LERP operator for CGPoint
public func ◊ (ab: (CGPoint, CGPoint), t: CGFloat) -> CGPoint
{
    return CGPoint(
        x: (ab.0.x, ab.1.x) ◊ t,
        y: (ab.0.y, ab.1.y) ◊ t
    )
}
