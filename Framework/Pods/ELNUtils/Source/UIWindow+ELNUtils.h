//
//  UIWindow+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 09.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

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
- (void)eln_replaceRootViewControllerWithViewController:(UIViewController *)viewController animation:(ELNRootViewControllerTransitionAnimation)animation completion:(void (^ _Nullable)(BOOL finished))completion;

@end

NS_ASSUME_NONNULL_END
