//
//  UIColor.swift
//  Interpolation
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import UIKit

/*
extension UIColor : LinearInterpolatable
{
    public typealias InterpolationFactor = CGFloat
    public typealias InterpolationResult = UIColor
    
    public static func lerp(a: UIColor, b: UIColor, f: UIColor.InterpolationFactor) -> UIColor
    {
        let A = rgba(a)
        let B = rgba(b)
        
        return UIColor(
            red: (A.red, B.red) ◊ f,
            green: (A.green, B.green) ◊ f,
            blue: (A.blue, B.blue) ◊ f,
            alpha: (A.alpha, B.alpha) ◊ f
        )
    }
}
*/
/// LERP operator for UIColor (based on RGBA values)
public func ◊ (ab: (UIColor, UIColor), t: CGFloat) -> UIColor
{
    func rgba(color: UIColor) -> (red: CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat)
    {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        var alpha : CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }

    let A = rgba(ab.0)
    let B = rgba(ab.1)
    
    return UIColor(
        red: (A.red, B.red) ◊ t,
        green: (A.green, B.green) ◊ t,
        blue: (A.blue, B.blue) ◊ t,
        alpha: (A.alpha, B.alpha) ◊ t
    )
}
