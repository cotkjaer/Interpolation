//
//  UIOffset.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import UIKit

public func ◊ (ab: (UIOffset, UIOffset), t: CGFloat) -> UIOffset
{
    return UIOffset(
        horizontal: (ab.0.horizontal, ab.1.horizontal) ◊ t,
        vertical: (ab.0.vertical, ab.1.vertical) ◊ t
    )
}


