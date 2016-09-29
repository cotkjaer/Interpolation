//
//  InterpolationTests.swift
//  InterpolationTests
//
//  Created by Christian Otkjær on 20/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
import Interpolation

class InterpolationTests: XCTestCase
{
    func test_Float()
    {
        let f1 = Float(1)
        let f2 = Float(2)
        
        XCTAssertEqual((f1, f2) ◊ 0.5, 1.5)
    }
    
    func test_Double()
    {
        let d1 = Double(1)
        let d2 = Double(2)
        
        XCTAssertEqual((d1, d2) ◊ 0.5, 1.5)
    }
    
    func test_CGFloat()
    {
        let f1 = CGFloat(1)
        let f2 = CGFloat(2)
        
        XCTAssertEqual((f1, f2) ◊ 0.5, 1.5)
    }
    
    func test_CGPoint()
    {
        let p1 = CGPoint.zero
        let p2 = CGPoint(x: 1, y: 10)
        
        XCTAssertEqual((p1, p2) ◊ 0.5, CGPoint(x: 0.5, y: 5))
    }
    
    func test_UIColor()
    {
        let c1 = UIColor(white: 0, alpha: 0)
        let c2 = UIColor(white: 0.5, alpha: 1)
        
        XCTAssertEqual((c1, c2) ◊ 0.5, UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.5))
    }
    
    func test_Array()
    {
        let a0 : [Double] = []
        let a1 = [1.0]
        let a2 = [1.0,2.0]
        let a3 = [1.0,2.0,3.0]

        XCTAssertEqual(a0 ◊ 0.5, [])
        XCTAssertEqual(a1 ◊ 0.5, [])
        XCTAssertEqual(a2 ◊ 0.1, [1.1])
        XCTAssertEqual(a3 ◊ 0.5, [1.5,2.5])
        
        let t0 : [Double] = []
        let t1 = [0.0]
        let t2 = [0.5,1.0]
        let t3 = [0,0.5,1]
        
        XCTAssertEqual(a2 ◊ t1, [1.0])
        XCTAssertEqual(a3 ◊ t2, [1.5, 3.0])
        XCTAssertEqual(a3 ◊ t3, [1.0, 2.5])
        XCTAssertEqual(a2 ◊ t0, [])
        XCTAssertEqual(a3 ◊ t1, [])
    }
}
