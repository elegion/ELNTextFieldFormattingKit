//
//  UINavigationController+ELNUtils.m
//  ELNUtils
//
//  Created by Dmitry Nesterenko on 04.04.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import "UINavigationController+ELNUtils.h"

static NSTimeInterval const kAnimationDuration = 0.3;

@implementation UINavigationController (ELNUtils)

- (void)eln_pushViewController:(UIViewController *)viewController withAnimation:(ELNNavigationControllerTransitionAnimation)animation {
    switch (animation) {
        case ELNNavigationControllerTransitionAnimationNone:
            [self pushViewController:viewController animated:NO];
            break;
            
        case ELNNavigationControllerTransitionAnimationDefault:
            [self pushViewController:viewController animated:YES];
            break;
            
        case ELNNavigationControllerTransitionAnimationFade: {
            CATransition *transition = [CATransition animation];
            transition.duration = kAnimationDuration;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            transition.type = kCATransitionFade;
            [self.view.layer addAnimation:transition forKey:nil];
            [self pushViewController:viewController animated:NO];
        }
            break;
    }
}

- (UIViewController *)eln_popViewControllerWithAnimation:(ELNNavigationControllerTransitionAnimation)animation {
    switch (animation) {
        case ELNNavigationControllerTransitionAnimationNone:
            return [self popViewControllerAnimated:NO];
            
        case ELNNavigationControllerTransitionAnimationDefault:
            return [self popViewControllerAnimated:YES];
            
        case ELNNavigationControllerTransitionAnimationFade: {
            CATransition *transition = [CATransition animation];
            transition.duration = kAnimationDuration;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            transition.type = kCATransitionFade;
            [self.view.layer addAnimation:transition forKey:nil];
            return [self popViewControllerAnimated:NO];
        }
    }
}

@end
