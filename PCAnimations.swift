//
//  PCAnimations.swift
//  PCAnimation-Example
//
//  Created by Priyabrata Chowley on 14/07/17.
//  Copyright © 2017 Priyabrata Chowley. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - View Animations
    
    /**
     
     A small animation function for scaling a view
     
     - Author: Priyabrata Chowley
     
     - Returns:
     Nothing
     
     - Parameters:
        - fromScale: from which point it starts scaling
        - toScale: to which point it gets scaled
     
     - Important:
     This function can be used for the scaling up or down. depending upon the requirement
     
     
     */
    func animationScale(fromScale: CGFloat, toScale: CGFloat, withDuration duration: CGFloat) {
        transform = CGAffineTransform(scaleX: fromScale, y: fromScale)
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            self.transform = CGAffineTransform(scaleX: toScale, y: toScale)
        })
    }
    
    
    /**
     
     A small animation function for poping a view
     
     - Author: Priyabrata Chowley
     
     - Returns:
     Nothing
     
     - Parameters:
         - minimumScaleSize: from which point it starts poping
         - maximumScaleSize: to which point it gets poped
         - duration: duration for the animation
     
     - Important:
     This function can be used for the poping up and then down.
     
     
     */
    func animationPop(fromMinimumSize minimumScaleSize: CGFloat, maximumSize maximumScaleSize: CGFloat, withDuration duration: CGFloat) {
        transform = CGAffineTransform(scaleX: minimumScaleSize, y: minimumScaleSize)
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            self.transform = CGAffineTransform(scaleX: maximumScaleSize, y: maximumScaleSize)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
                self.transform = CGAffineTransform(scaleX: minimumScaleSize, y: minimumScaleSize)
            })
        })
    }
    
    /**
     
     A small animation function for changing a constraint's constant with animation
     
     - Author: Priyabrata Chowley
     
     - Returns:
     Nothing
     
     - Parameters:
         - constraint: Constraint which constant's needs to change
         - constant: to which constant value
         - duration: animation duration
     
     */
    func animationChangeConstraints(_ constraint: NSLayoutConstraint, toValueConstant constant: CGFloat, withDuration duration: CGFloat) {
        constraint.constant = constant
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            self.layoutIfNeeded()
        })
    }
    
    /**
     
     A small animation function for changing a Alpha of a view with animation
     
     - Author: Priyabrata Chowley
     
     - Returns:
     Nothing
     
     - Parameters:
         - fromAlpha: from which opacity it starts
         - toAlpha: to which opacity it gets
         - duration: duration for the animation
     
     - Important:
     This function can be used for changing alpha up or down. depending upon needs
     
     */
    func animationChangeAlpha(withDuration duration: CGFloat, andFromAlpha fromAlpha: CGFloat, andToAlpha toAlpha: CGFloat) {
        alpha = fromAlpha
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            self.alpha = toAlpha
        })
    }
    
    func animationPulse() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.90
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.6
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func animationFlash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.4
        flash.fromValue = 1
        flash.toValue = 0.2
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
        layer.add(flash, forKey: nil)
    }
    
    
    func animationShake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.3
        shake.repeatCount = 1
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    func animationFade() {
        let actualPoint: CGPoint = self.center
        layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2)
        center = actualPoint
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        })
    }
    
    func animationFromLeft() {
        let actualPoint: CGPoint = center
        let leftX: CGFloat = center.x - frame.size.width
        center = CGPoint(x: leftX, y: center.y)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.center = actualPoint
        })
    }
    
    func animationFromRight() {
        let actualPoint: CGPoint = center
        let leftX: CGFloat = center.x + frame.size.width
        center = CGPoint(x: leftX, y: center.y)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.center = actualPoint
        })
    }
}

