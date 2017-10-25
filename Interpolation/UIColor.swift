//
//  UIColor.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import UIKit

/** Simple RGBA extraction
 */
extension UIColor
{
    func rgba() -> (red: CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat)
    {
        var tuple: (red: CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) = (0,0,0,0)
        
        getRed(&tuple.red, green: &tuple.green, blue: &tuple.blue, alpha: &tuple.alpha)
        
        return tuple
    }
}

extension UIColor: Interpolatable
{
    public typealias InterpolationFactor = CGFloat
    public typealias InterpolationResult = UIColor
    
    public static func lerp(a: UIColor, b: UIColor, t: CGFloat) -> UIColor
    {
        let A = a.rgba()
        let B = b.rgba()
        
        return UIColor(
            red: (A.red, B.red) ◊ t,
            green: (A.green, B.green) ◊ t,
            blue: (A.blue, B.blue) ◊ t,
            alpha: (A.alpha, B.alpha) ◊ t
        )
    }
}

