//
//  DrawView.swift
//  UIDrawLineTest
//
//  Created by chuck chan on 15/12/2.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class DrawView: UIView {
    override func drawRect(rect: CGRect) {
        UIColor.purpleColor().set()
        let ref = UIGraphicsGetCurrentContext()
        CGContextSetAllowsAntialiasing(ref, true)
        //draw circle
        CGContextStrokeEllipseInRect(ref, CGRectMake(50, 50, 100, 100))
        CGContextStrokePath(ref)
        //draw circle with hudu
        CGContextSetStrokeColorWithColor(ref, UIColor.redColor().CGColor)
        CGContextAddArc(ref, 300, 100, 50, 0, CGFloat(180 * M_PI / 180), 1)
        CGContextStrokePath(ref)
        //draw String
        let name:NSString = "chuck"
        name.drawAtPoint(CGPointMake(100, 200), withAttributes: nil)
        //draw picture
        CGContextSetShadow(ref, CGSizeMake(3,3), 10)
        let image = UIImage(named: "2.JPG")
        image?.drawAtPoint(CGPointMake(150, 250))
        CGContextSetShadow(ref, CGSizeMake(0,0), 0)
        //draw with path
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 50, 350)
        CGPathAddLineToPoint(path, nil, 50, 450)
        CGContextAddPath(ref, path)
        CGContextStrokePath(ref)
        //draw triangle
        //画直线
        UIColor.cyanColor().set()
        CGContextSetLineWidth(ref, 5)
        CGContextMoveToPoint(ref,10, 20)
        CGContextAddLineToPoint(ref, 40, 60)
        CGContextStrokePath(ref)
        
        CGContextSetLineWidth(ref, 5)
        CGContextMoveToPoint(ref,10, 20)
        CGContextAddLineToPoint(ref, 60, 20)
        CGContextStrokePath(ref)
        
        CGContextSetLineWidth(ref, 5)
        CGContextMoveToPoint(ref,60, 20)
        CGContextAddLineToPoint(ref, 40, 60)
        CGContextStrokePath(ref)
        
    }
    
    func printInvokePath(message:String){
        print("this is message " + message)
    }
}
