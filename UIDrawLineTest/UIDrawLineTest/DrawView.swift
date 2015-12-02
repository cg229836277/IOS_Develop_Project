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
        CGContextSetLineWidth(ref, 5)
        CGContextMoveToPoint(ref,10, 20)
        CGContextAddLineToPoint(ref, 200, 300)
        CGContextStrokePath(ref)
    }
    
    func printInvokePath(message:String){
        print("this is message " + message)
    }
}
