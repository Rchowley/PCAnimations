//
//  PCAnimations.swift
//  PCAnimation-Example
//
//  Created by Priyabrata Chowley on 14/07/17.
//  Copyright © 2017 Priyabrata Chowley. All rights reserved.
//

import UIKit

class PCAnimations {
    
    static let shared = PCAnimations();
    
    // MARK: - View Animations
    
    /**
     
     A small animation function for scaling a view
     
     - Author: Priyabrata Chowley
     
     - Returns:
     Nothing
     
     - Parameters:
        - view: the view on which the animation needs to be happen
        - fromScale: from which point it starts scaling
        - toScale: to which point it gets scaled
     
     - Important:
     This function can be used for the scaling up or down. depending upon the requirement
     
     
     */
    func animationScale(_ view: UIView, fromScale: CGFloat, toScale: CGFloat, withDuration duration: CGFloat) {
        view.transform = CGAffineTransform(scaleX: fromScale, y: fromScale)
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            view.transform = CGAffineTransform(scaleX: toScale, y: toScale)
        })
    }
    
    
    /**
     
     A small animation function for poping a view
     
     - Author: Priyabrata Chowley
     
     - Returns:
     Nothing
     
     - Parameters:
         - view: the view on which the animation needs to be happen
         - minimumScaleSize: from which point it starts poping
         - maximumScaleSize: to which point it gets poped
         - duration: duration for the animation
     
     - Important:
     This function can be used for the poping up and then down.
     
     
     */
    func animationPop(_ view: UIView, minimumSize minimumScaleSize: CGFloat, maximumSize maximumScaleSize: CGFloat, withDuration duration: CGFloat) {
        view.transform = CGAffineTransform(scaleX: minimumScaleSize, y: minimumScaleSize)
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            view.transform = CGAffineTransform(scaleX: maximumScaleSize, y: maximumScaleSize)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
                view.transform = CGAffineTransform(scaleX: minimumScaleSize, y: minimumScaleSize)
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
         - controller: on which controller the constraints exists. Generally Self
     
     */
    func animationChangeConstraints(_ constraint: NSLayoutConstraint, toValueConstant constant: CGFloat, withDuration duration: CGFloat, onController controller: UIViewController) {
        constraint.constant = constant
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            controller.view.layoutIfNeeded()
        })
    }
    
    /**
     
     A small animation function for changing a Alpha of a view with animation
     
     - Author: Priyabrata Chowley
     
     - Returns:
     Nothing
     
     - Parameters:
         - view: the view on which the animation needs to be happen
         - fromAlpha: from which opacity it starts
         - toAlpha: to which opacity it gets
         - duration: duration for the animation
     
     - Important:
     This function can be used for changing alpha up or down. depending upon needs
     
     */
    func animationChangeAlpha(_ view: UIView, withDuration duration: CGFloat, andFromAlpha fromAlpha: CGFloat, andToAlpha toAlpha: CGFloat) {
        view.alpha = fromAlpha
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            view.alpha = toAlpha
        })
    }
    
    func animationPulse(onView view: UIView) {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.90
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.6
        pulse.damping = 1.0
        
        view.layer.add(pulse, forKey: "pulse")
    }
    
    func animationFlash(onView view: UIView) {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.4
        flash.fromValue = 1
        flash.toValue = 0.2
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
        view.layer.add(flash, forKey: nil)
    }
    
    
    func animationShake(onView view: UIView) {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.3
        shake.repeatCount = 1
        shake.autoreverses = true
        
        let centerOfView = view.center;
        
        let fromPoint = CGPoint(x: centerOfView.x - 5, y: centerOfView.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: centerOfView.x + 5, y: centerOfView.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        view.layer.add(shake, forKey: "position")
    }
    
    func animationFade(onView view: UIView) {
        let actualPoint: CGPoint = view.center
        view.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2)
        view.center = actualPoint
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            view.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        })
    }
    
    func animationFromLeft(onView view: UIView) {
        let actualPoint: CGPoint = view.center
        let leftX: CGFloat = view.center.x - view.frame.size.width
        view.center = CGPoint(x: leftX, y: view.center.y)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            view.center = actualPoint
        })
    }
    
    func animationFromRight(onView view: UIView) {
        let actualPoint: CGPoint = view.center
        let leftX: CGFloat = view.center.x + view.frame.size.width
        view.center = CGPoint(x: leftX, y: view.center.y)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            view.center = actualPoint
        })
    }
}

