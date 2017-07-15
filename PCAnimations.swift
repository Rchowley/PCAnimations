//
//  PCAnimations.swift
//  PCAnimation-Example
//
//  Created by Priyabrata Chowley on 14/07/17.
//  Copyright © 2017 Priyabrata Chowley. All rights reserved.
//

import UIKit

func DEGREE(angle: Double) -> Double {
    return (angle) / 180.0 * .pi
}

class PCAnimations {
    
    static let shared = PCAnimations();
    
    // MARK: - View Animations
     func animationScale(_ view: UIView, fromScale: CGFloat, toScale: CGFloat) {
        view.transform = CGAffineTransform(scaleX: fromScale, y: fromScale)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            view.transform = CGAffineTransform(scaleX: toScale, y: toScale)
        })
    }
    
     func animationPop(_ view: UIView, minimumSize minimumScaleSize: CGFloat, maximumScaleSize: CGFloat, withDuration duration: CGFloat) {
        view.transform = CGAffineTransform(scaleX: minimumScaleSize, y: minimumScaleSize)
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            view.transform = CGAffineTransform(scaleX: maximumScaleSize, y: maximumScaleSize)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
                view.transform = CGAffineTransform(scaleX: minimumScaleSize, y: minimumScaleSize)
            })
        })
    }
    
     func animationVibrateView(_ view: UIView, withDegree degree: CGFloat) {
        var shiverAnimationR: CABasicAnimation?
        shiverAnimationR = CABasicAnimation(keyPath: "transform.rotation.z")
        shiverAnimationR?.toValue = Float(DEGREE(angle: Double(degree)))
        shiverAnimationR?.duration = 0.1
        shiverAnimationR?.repeatCount = 1000000.0
        //Using a high value
        shiverAnimationR?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        view.layer.add(shiverAnimationR!, forKey: "shiverAnimationR")
        var shiverAnimationL: CABasicAnimation?
        shiverAnimationL = CABasicAnimation(keyPath: "transform.rotation.z")
        shiverAnimationL?.toValue = Float(DEGREE(angle: Double(degree)))
        shiverAnimationL?.duration = 0.1
        shiverAnimationL?.repeatCount = 1000000.0
        shiverAnimationL?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        shiverAnimationL?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        view.layer.add(shiverAnimationL!, forKey: "shiverAnimationL")
    }
    
     func animationPerpectiveTransform(_ view: UIView, withAngle angle: CGFloat, withX x: CGFloat, withY y: CGFloat, withZ z: CGFloat) {
        /*
         
         CGFloat angle == any value on which the element should rotate eg rotating angle
         CGFloat x == 1.0f for active rotation in x direction. e.g upside down
         CGFloat y == 1.0f for active rotation in y direction. e.g rotation in depth. like on a surface
         CGFloat z == 1.0f for active rotation in z direction. e.g fan
         
         */
        let myView: UIView? = view
        let layer: CALayer? = myView?.layer
        var rotationAndPerspectiveTransform: CATransform3D = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / -500
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, angle * .pi / 180.0, x, y, z)
        layer?.transform = rotationAndPerspectiveTransform
    }
    
     func animationChangeConstraints(_ constraint: NSLayoutConstraint, toValueConstant constant: CGFloat, withDuration duration: CGFloat, on controller: UIViewController) {
        constraint.constant = constant
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            controller.view.layoutIfNeeded()
        })
    }
    
     func animationChangeAlpha(_ view: UIView, withDuration duration: CGFloat, andFromAlpha fromAlpha: CGFloat, andToAlpha toAlpha: CGFloat) {
        view.alpha = fromAlpha
        UIView.animate(withDuration: TimeInterval(duration), animations: {() -> Void in
            view.alpha = toAlpha
        })
    }
    
    // MARK: - Cell Animations
    // MARK: - Fade In

     func animationFade(onCell cell: UITableViewCell) {
        let actualPoint: CGPoint = cell.center
        cell.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2)
        cell.center = actualPoint
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        })
    }
    
     func animationFromLeft(onCell cell: UITableViewCell) {
        let actualPoint: CGPoint = cell.center
        let leftX: CGFloat = cell.center.x - cell.frame.size.width
        cell.center = CGPoint(x: leftX, y: cell.center.y)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            cell.center = actualPoint
        })
    }
    
     func animationFromRight(onCell cell: UITableViewCell) {
        let actualPoint: CGPoint = cell.center
        let leftX: CGFloat = cell.center.x + cell.frame.size.width
        cell.center = CGPoint(x: leftX, y: cell.center.y)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            cell.center = actualPoint
        })
    }
}

