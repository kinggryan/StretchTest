//
//  ViewController.swift
//  StretchTest
//
//  Created by Ryan King on 1/9/15.
//  Copyright (c) 2015 Ryan King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var fontLibrary = Dictionary<String, Dictionary<CGFloat, CTFont>>()
    
    private var affineScaleOn: Bool = false
    private var contentsScaleOn: Bool = false
    private var viewRasterizationScale: Bool = false
    private var textContentsScale: Bool = false
    private var textRasterizationScale: Bool = false
    private var layerContentsScale: Bool = false
    private var textLayerContentsScale: Bool = false
    
    private var scaleAmount:CGFloat = 2.5 //1024.0/768.0
    private var textField: CustomTextView = CustomTextView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get screen center
        let screenCenter: CGPoint = CGPoint(x: UIScreen.mainScreen().bounds.width/2,y: UIScreen.mainScreen().bounds.height/2)

        // Set up text field
        textField = CustomTextView(frame: CGRect(x:screenCenter.x-25,y:screenCenter.y,width:200,height:50))
        textField.text = "words"
        textField.font = UIFont.systemFontOfSize(18)
        
        // Set up scale button
        let affineScaleButton = UIButton(frame:CGRect(x:screenCenter.x-150,y:screenCenter.y-50,width:125,height:20))
        affineScaleButton.backgroundColor = UIColor.blackColor()
        affineScaleButton.setTitle("View Affine Transform", forState: .Normal)
        affineScaleButton.titleLabel!.font = UIFont.systemFontOfSize(11.0)
        affineScaleButton.addTarget(self, action: "affineScale:", forControlEvents: .TouchUpInside)
        
        // Set up contentsScale button
        let viewContentsScaleButton = UIButton(frame:CGRect(x:screenCenter.x-150,y:screenCenter.y-20,width:125,height:20))
        viewContentsScaleButton.backgroundColor = UIColor.blackColor()
        viewContentsScaleButton.setTitle("View ContentsScale", forState: .Normal)
        viewContentsScaleButton.titleLabel!.font = UIFont.systemFontOfSize(11.0)
        viewContentsScaleButton.addTarget(self, action: "contentScaleButtonPressed:", forControlEvents: .TouchUpInside)
        
        // Set up rasterization Scale button
        let viewRasterizationScaleButton = UIButton(frame:CGRect(x:screenCenter.x-150,y:screenCenter.y+10,width:125,height:20))
        viewRasterizationScaleButton.backgroundColor = UIColor.blackColor()
        viewRasterizationScaleButton.setTitle("View Rasterization Scale", forState: .Normal)
        viewRasterizationScaleButton.titleLabel!.font = UIFont.systemFontOfSize(10.0)
        viewRasterizationScaleButton.addTarget(self, action: "viewRasterizationScale:", forControlEvents: .TouchUpInside)
        
        // Set up contentsScale button
        let textContentsScaleButton = UIButton(frame:CGRect(x:screenCenter.x-150,y:screenCenter.y+40,width:125,height:20))
        textContentsScaleButton.backgroundColor = UIColor.blackColor()
        textContentsScaleButton.setTitle("Text ContentsScale", forState: .Normal)
        textContentsScaleButton.titleLabel!.font = UIFont.systemFontOfSize(11.0)
        textContentsScaleButton.addTarget(self, action: "textContentScaleButtonPressed:", forControlEvents: .TouchUpInside)
        
        // Set up text Rasterization Scale button
        let textRasterizationScaleButton = UIButton(frame:CGRect(x:screenCenter.x-150,y:screenCenter.y+70,width:125,height:20))
        textRasterizationScaleButton.backgroundColor = UIColor.blackColor()
        textRasterizationScaleButton.setTitle("Text Rasterization Scale", forState: .Normal)
        textRasterizationScaleButton.titleLabel!.font = UIFont.systemFontOfSize(10.0)
        textRasterizationScaleButton.addTarget(self, action: "textRasterizationScale:", forControlEvents: .TouchUpInside)
        
        // Set up text Rasterization Scale button
        let layerContentsScaleButton = UIButton(frame:CGRect(x:screenCenter.x-150,y:screenCenter.y+100,width:125,height:20))
        layerContentsScaleButton.backgroundColor = UIColor.blackColor()
        layerContentsScaleButton.setTitle("Layer Contents Scale", forState: .Normal)
        layerContentsScaleButton.titleLabel!.font = UIFont.systemFontOfSize(10.0)
        layerContentsScaleButton.addTarget(self, action: "layerContentScaleButtonPressed:", forControlEvents: .TouchUpInside)
        
        // Set up text Rasterization Scale button
        let textLayerContentsScaleButton = UIButton(frame:CGRect(x:screenCenter.x-150,y:screenCenter.y+130,width:125,height:20))
        textLayerContentsScaleButton.backgroundColor = UIColor.blackColor()
        textLayerContentsScaleButton.setTitle("Text Layer Contents Scale", forState: .Normal)
        textLayerContentsScaleButton.titleLabel!.font = UIFont.systemFontOfSize(10.0)
        textLayerContentsScaleButton.addTarget(self, action: "textLayerContentScaleButtonPressed:", forControlEvents: .TouchUpInside)
        
   //     var currentContext = UIGraphicsGetCurrentContext()
     //   CGContextScaleCTM(currentContext, 5, 5)
        
        // Add generated views
        view.addSubview(textField)
        view.addSubview(affineScaleButton)
        view.addSubview(viewContentsScaleButton)
        view.addSubview(viewRasterizationScaleButton)
        view.addSubview(textContentsScaleButton)
        view.addSubview(textRasterizationScaleButton)
        view.addSubview(layerContentsScaleButton)
        view.addSubview(textLayerContentsScaleButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func affineScale(sender: UIButton!) {
        view = recreateView(view)
        
        if !affineScaleOn {
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, scaleAmount, scaleAmount)
            affineScaleOn = true
            
            // Change button color to indicate that this is on
            sender.backgroundColor = UIColor.greenColor()
        }
        else {
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
            affineScaleOn = false
            // Change button color to indicate that this is on
            sender.backgroundColor = UIColor.blackColor()
        }
    }
    
    func contentScaleButtonPressed(sender:UIButton!) {
        view = recreateView(view)
        
        if contentsScaleOn {
            // Turn off
            contentsScaleOn = false
            
            view.contentScaleFactor = UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.blackColor()
        }
        else {
            // Turn On
            contentsScaleOn = true
            
            view.contentScaleFactor = scaleAmount * UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.greenColor()
        }
        
        view.setNeedsDisplay()
    }
    
    func layerContentScaleButtonPressed(sender:UIButton!) {
        view = recreateView(view)
        
        if layerContentsScale {
            // Turn off
            layerContentsScale = false
            
            view.layer.contentsScale = UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.blackColor()
        }
        else {
            // Turn On
            layerContentsScale = true
            
            view.layer.contentsScale = scaleAmount * UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.greenColor()
        }
        
        view.setNeedsDisplay()
    }
    
    func viewRasterizationScale(sender:UIButton!) {
        view = recreateView(view)
        
        if viewRasterizationScale {
            // Turn Off
            viewRasterizationScale = false
            
            view.layer.shouldRasterize = false
            view.layer.rasterizationScale = UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.blackColor()
        }
        else {
            // Turn On
            viewRasterizationScale = true
            
            view.layer.shouldRasterize = true
            view.layer.rasterizationScale = scaleAmount * UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.greenColor()
        }
        
        view.setNeedsDisplay()
    }
    
    func textContentScaleButtonPressed(sender:UIButton!) {
        let oldTextField = textField
        textField = recreateView(textField) as CustomTextView
        
        if textContentsScale {
            // Turn Off
            textContentsScale = false
            
            textField.contentScaleFactor = UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.blackColor()
        }
        else {
            // Turn On
            textContentsScale = true
            
            textField.contentScaleFactor = scaleAmount * UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.greenColor()
        }
        
        oldTextField.removeFromSuperview()
        view.addSubview(textField)
        
        textField.setNeedsDisplay()
        view.setNeedsDisplay()
    }
    
    func textLayerContentScaleButtonPressed(sender:UIButton!) {
        let oldTextField = textField
        textField = recreateView(textField) as CustomTextView
        
        if textLayerContentsScale {
            // Turn Off
            textLayerContentsScale = false
            
            textField.layer.contentsScale = UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.blackColor()
        }
        else {
            // Turn On
            textLayerContentsScale = true
            
            textField.layer.contentsScale = scaleAmount * UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.greenColor()
        }
        
        oldTextField.removeFromSuperview()
        view.addSubview(textField)
        
        textField.setNeedsDisplay()
        view.setNeedsDisplay()
    }
    
    func textRasterizationScale(sender:UIButton!) {
        let oldTextField = textField
        textField = recreateView(textField) as CustomTextView
        
        if textRasterizationScale {
            // Turn Off
            textRasterizationScale = false
            
            textField.layer.shouldRasterize = false
            textField.layer.rasterizationScale = UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.blackColor()
        }
        else {
            // Turn On
            textRasterizationScale = true
            
            textField.layer.shouldRasterize = true
            textField.layer.rasterizationScale = scaleAmount * UIScreen.mainScreen().scale
            sender.backgroundColor = UIColor.greenColor()
        }
        
        oldTextField.removeFromSuperview()
        view.addSubview(textField)
        
        textField.setNeedsDisplay()
        view.setNeedsDisplay()
    }
    
    func recreateView(originalView: UIView) -> UIView {
        // if this is a text view, set their properties
        var newView: UIView
        if let originalTextView = originalView as? CustomTextView {
            var newTextView = CustomTextView(frame: originalTextView.frame)
            newTextView.text = originalTextView.text
            newTextView.font = originalTextView.font
            newView = newTextView
        }
        else {
            newView = UIView(frame: originalView.frame)
            newView.backgroundColor = originalView.backgroundColor
        }
        
        for child in originalView.subviews {
            if let subview = child as? UIView {
                newView.addSubview(subview)
            }
        }
        
        newView.contentScaleFactor = originalView.contentScaleFactor
        newView.transform = originalView.transform
        newView.layer.contentsScale = originalView.layer.contentsScale
        newView.layer.shouldRasterize = originalView.layer.shouldRasterize
        newView.layer.rasterizationScale = originalView.layer.rasterizationScale
        
        return newView;
    }
    
    // MARK: Not being used
    func contentScaleViewAndSubviews(viewToScale: UIView, scaleFactor: CGFloat) {
        viewToScale.layer.contentsScale = scaleFactor
        for child in viewToScale.subviews {
            if let subview = child as? UIView {
                contentScaleViewAndSubviews(subview,scaleFactor:scaleFactor)
            }
        }
    }
}

