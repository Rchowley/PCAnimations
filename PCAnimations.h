//
//  Animations.h
//  Created by Priyabrata Chowley on 11/9/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PCAnimations : NSObject

+ (void)animationScaleView:(UIView *)view fromScale:(CGFloat) fromScale toScale:(CGFloat) toScale;
+ (void)animationVibrateView:(UIView*)view withDegree:(CGFloat)degree;
+ (void)animationPerpectiveTransform:(UIView *)view withAngle:(CGFloat)angle withX:(CGFloat)x withY:(CGFloat)y withZ:(CGFloat)z;
+ (void)animationChangeConstraints:(NSLayoutConstraint *)constraint toValueConstant:(CGFloat)constant withDuration:(CGFloat)duration onViewController:(UIViewController *)controller;
+ (void)animationChangeAlpha:(UIView *)view withDuration:(CGFloat)duration andFromAlpha:(CGFloat)fromAlpha andToAlpha:(CGFloat)toAlpha;
+ (void)animationPopView:(UIView *)view minimumSize:(CGFloat)minimumScaleSize maximumScaleSize:(CGFloat)maximumScaleSize withDuration:(CGFloat)duration;

// MARK: - TableviewCell Animation -
+ (void)animationCellFadeIn:(UITableView *)tableView andCell:(UITableViewCell *)cell onIndexPath:(NSIndexPath *)indexPath;
+ (void)animationCellFromLeft:(UITableView *)tableView andCell:(UITableViewCell *)cell onIndexPath:(NSIndexPath *)indexPath;
+ (void)animationCellFromRight:(UITableView *)tableView andCell:(UITableViewCell *)cell onIndexPath:(NSIndexPath *)indexPath;

@end
