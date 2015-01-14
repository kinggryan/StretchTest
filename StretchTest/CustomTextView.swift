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
        var currentContext = UIGraphicsGetCurrentContext()
        CGContextScaleCTM(currentContext, 2, 2)
    
        layer.drawInContext(currentContext)
    }
}