//
//  ColorTests.swift
//  InterpolationTests
//
//  Created by Christian Otkjær on 25/10/2017.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

import XCTest
import Interpolation
import UIKit

class ColorTests: XCTestCase
{
    static let solidWhite = UIColor(white: 1, alpha: 1)
    static let transparentWhite = UIColor(white: 1, alpha: 0)
    
    static let solidBlack = UIColor(white: 0, alpha: 1)
    static let transparentBlack = UIColor(white: 0, alpha: 0)

    func test_UIColor()
    {
        let c1 = UIColor(white: 0, alpha: 0)
        let c2 = UIColor(white: 0.5, alpha: 1)
        
        XCTAssertEqual((c1, c2) ◊ 0.5, UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.5))
    }
    
    func test_alpha()
    {
        XCTAssertEqual(lerp(a: ColorTests.solidWhite, b: ColorTests.transparentWhite, t: 0.2), UIColor(red: 1, green: 1, blue: 1, alpha: 0.8))
    }
    
}
