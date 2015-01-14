//
//  CustomUIView.swift
//  StretchTest
//
//  Created by Ryan King on 1/14/15.
//  Copyright (c) 2015 Ryan King. All rights reserved.
//

import Foundation
import UIKit

class CustomUIView: UIView {
    override func drawRect(rect: CGRect) {
        var currentContext:CGContextRef = UIGraphicsGetCurrentContext()
        CGContextScaleCTM(currentContext, 5, 5)
    }
}