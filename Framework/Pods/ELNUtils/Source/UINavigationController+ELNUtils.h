//
//  UINavigationController+ELNUtils.h
//  ELNUtils
//
//  Created by Dmitry Nesterenko on 04.04.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ELNNavigationControllerTransitionAnimation) {
    ELNNavigationControllerTransitionAnimationNone,
    ELNNavigationControllerTransitionAnimationFade,
    ELNNavigationControllerTransitionAnimationDefault
};

@interface UINavigationController (ELNUtils)

- (void)eln_pushViewController:(UIViewController *)viewController withAnimation:(ELNNavigationControllerTransitionAnimation)animation;

- (nullable UIViewController *)eln_popViewControllerWithAnimation:(ELNNavigationControllerTransitionAnimation)animation;

@end

NS_ASSUME_NONNULL_END
