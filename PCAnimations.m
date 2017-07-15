//
//  Animations.m
//  Created by Priyabrata Chowley on 11/9/15.
//

#define DEGREE(angle) ((angle) / 180.0 * M_PI)

#import "PCAnimations.h"
#import <UIKit/UIKit.h>

@implementation PCAnimations

// MARK: - View Animations

+ (void)animationScaleView:(UIView *)view fromScale:(CGFloat) fromScale toScale:(CGFloat) toScale{
    view.transform = CGAffineTransformMakeScale(fromScale, fromScale);
    
    [UIView animateWithDuration:0.3 animations:^{
        view.transform = CGAffineTransformMakeScale(toScale, toScale);
    }];
}

+ (void)animationPopView:(UIView *)view minimumSize:(CGFloat)minimumScaleSize maximumScaleSize:(CGFloat)maximumScaleSize withDuration:(CGFloat)duration {
    view.transform = CGAffineTransformMakeScale(minimumScaleSize, minimumScaleSize);
    
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformMakeScale(maximumScaleSize, maximumScaleSize);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration animations:^{
            view.transform = CGAffineTransformMakeScale(minimumScaleSize, minimumScaleSize);
        }];
    }];
}

+ (void)animationVibrateView:(UIView*)view withDegree:(CGFloat)degree{
    
    CABasicAnimation *shiverAnimationR;
    shiverAnimationR = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shiverAnimationR.toValue = [NSNumber numberWithFloat:DEGREE(degree)];
    shiverAnimationR.duration = 0.1;
    shiverAnimationR.repeatCount = 1000000.0; //Using a high value
    shiverAnimationR.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [view.layer addAnimation: shiverAnimationR forKey:@"shiverAnimationR"];
    
    CABasicAnimation * shiverAnimationL;
    shiverAnimationL = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shiverAnimationL.toValue = [NSNumber numberWithFloat:DEGREE(degree)];
    shiverAnimationL.duration = 0.1;
    shiverAnimationL.repeatCount = 1000000.0;
    shiverAnimationL.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [view.layer addAnimation: shiverAnimationL forKey:@"shiverAnimationL"];
    
}

+ (void)animationPerpectiveTransform:(UIView *)view withAngle:(CGFloat)angle withX:(CGFloat)x withY:(CGFloat)y withZ:(CGFloat)z{
    
    /*
     
     CGFloat angle == any value on which the element should rotate eg rotating angle
     CGFloat x == 1.0f for active rotation in x direction. e.g upside down
     CGFloat y == 1.0f for active rotation in y direction. e.g rotation in depth. like on a surface
     CGFloat z == 1.0f for active rotation in z direction. e.g fan
     
     */
    
    UIView *myView = view;
    CALayer *layer = myView.layer;
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -500;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, angle * M_PI / 180.0f, x, y, z);
    layer.transform = rotationAndPerspectiveTransform;
}

+ (void)animationChangeConstraints:(NSLayoutConstraint *)constraint toValueConstant:(CGFloat)constant withDuration:(CGFloat)duration onViewController:(UIViewController *)controller{
    constraint.constant = constant;
    
    [UIView animateWithDuration:duration animations:^{
        [controller.view layoutIfNeeded];
    }];
}

+ (void)animationChangeAlpha:(UIView *)view withDuration:(CGFloat)duration andFromAlpha:(CGFloat)fromAlpha andToAlpha:(CGFloat)toAlpha{
    view.alpha = fromAlpha;
    [UIView animateWithDuration:duration animations:^{
        view.alpha = toAlpha;
    }];
}

// MARK: - Cell Animations
// MARK: - Fade In
+ (void)animationCellFadeIn:(UITableView *)tableView andCell:(UITableViewCell *)cell onIndexPath:(NSIndexPath *)indexPath{
    
    CGPoint actualPoint = cell.center;
    cell.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2);
    cell.center = actualPoint;
    
    [UIView animateWithDuration:0.3 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
    }];
}
+ (void)animationCellFromLeft:(UITableView *)tableView andCell:(UITableViewCell *)cell onIndexPath:(NSIndexPath *)indexPath{
    
    CGPoint actualPoint = cell.center;
    
    CGFloat leftX = cell.center.x - cell.frame.size.width;
    
    cell.center = CGPointMake(leftX, cell.center.y);
    
    [UIView animateWithDuration:0.3 animations:^{
        cell.center = actualPoint;
    }];
}
+ (void)animationCellFromRight:(UITableView *)tableView andCell:(UITableViewCell *)cell onIndexPath:(NSIndexPath *)indexPath{
    
    CGPoint actualPoint = cell.center;
    
    CGFloat leftX = cell.center.x + cell.frame.size.width;
    
    cell.center = CGPointMake(leftX, cell.center.y);
    
    [UIView animateWithDuration:0.3 animations:^{
        cell.center = actualPoint;
    }];
}
@end
