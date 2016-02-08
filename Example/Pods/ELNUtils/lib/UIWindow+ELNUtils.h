//
//  UIWindow+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 09.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, ELNRootViewControllerTransitionAnimation) {
    ELNRootViewControllerTransitionAnimationNone,
    ELNRootViewControllerTransitionAnimationFromLeft,
    ELNRootViewControllerTransitionAnimationFromRight,
    ELNRootViewControllerTransitionAnimationCrossDissolve
};

@interface UIWindow (ELNUtils)

/** 
 Replaces root view controller with specified animation.
 Often used by the auth <-> main screens transition.
 */
- (void)eln_replaceRootViewControllerWithViewController:(UIViewController *)viewController animation:(ELNRootViewControllerTransitionAnimation)animation completion:(void (^)(BOOL finished))completion;

/** 
 Returns the toppest controller in the window checking inside
 tab bar controllers and navigation controllers.
 */
- (UIViewController *)eln_topViewController;

@end
