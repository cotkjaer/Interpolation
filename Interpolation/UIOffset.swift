//
//  UIOffset.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import UIKit

extension UIOffset : Interpolatable
{
    public typealias InterpolationFactor = CGFloat
    public typealias InterpolationResult = UIOffset

    public static func lerp(a: UIOffset, b: UIOffset, t: CGFloat) -> UIOffset
    {
        return UIOffset(horizontal: CGFloat.lerp(a: a.horizontal, b: b.horizontal, t: t), vertical: CGFloat.lerp(a: a.vertical, b: b.vertical, t: t))
    }
}
