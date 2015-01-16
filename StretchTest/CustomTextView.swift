//
//  CustomTextView.swift
//  StretchTest
//
//  Created by Ryan King on 1/14/15.
//  Copyright (c) 2015 Ryan King. All rights reserved.
//

import Foundation
import UIKit

class CustomTextView: UITextView {
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        //CGContextScaleCTM(context, 2, 2)

        //layer.drawInContext(currentContext)
        super.drawRect(rect)
        
//        CGContextBeginPath(context);
//
//        CGContextMoveToPoint(context, 0, 0)
//        CGContextAddLineToPoint(context, 0, 100)
//        CGContextSetLineWidth(context, 1);
//        
//        CGContextStrokePath(context);
        
        //CGContextScaleCTM(context, 0.5, 0.5)
    }
}