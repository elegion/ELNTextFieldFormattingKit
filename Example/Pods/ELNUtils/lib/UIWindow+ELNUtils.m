//
//  UIWindow+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 09.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIWindow+ELNUtils.h"

@implementation UIWindow (ELNUtils)

- (void)eln_replaceRootViewControllerWithViewController:(UIViewController *)viewController animation:(ELNRootViewControllerTransitionAnimation)animation completion:(void (^)(BOOL finished))completion
{
    BOOL hasVisibleView = self.rootViewController != nil && self.rootViewController.isViewLoaded && self.rootViewController.view.layer.presentationLayer != nil;
    if (!hasVisibleView) {
        self.rootViewController = viewController;
        return;
    }
    
    UIViewAnimationOptions options = UIViewAnimationOptionAllowAnimatedContent;
    switch (animation) {
        case ELNRootViewControllerTransitionAnimationFromLeft:
            options |= UIViewAnimationOptionTransitionFlipFromLeft;
            break;
            
        case ELNRootViewControllerTransitionAnimationFromRight:
            options |= UIViewAnimationOptionTransitionFlipFromRight;
            break;
            
        case ELNRootViewControllerTransitionAnimationCrossDissolve:
            options |= UIViewAnimationOptionTransitionCrossDissolve;
            break;
            
        case ELNRootViewControllerTransitionAnimationNone:
            // do nothing
            break;
    }
    
    // get current root view controller
    UIViewController *rootViewController = self.rootViewController;
    
    void (^completion_)(BOOL) = ^(BOOL finished){
        // dismiss any previously presented modal view controllers
        if (rootViewController.presentedViewController) {
            [self eln_dismissPresentedViewControllersForViewController:rootViewController completion:^{
                [rootViewController.view removeFromSuperview];
                
                if (completion) {
                    completion(finished);
                }
            }];
        } else {
            if (completion) {
                completion(finished);
            }
        }
    };
    
    BOOL animated = animation != ELNRootViewControllerTransitionAnimationNone;
    if (animated) {
        UIView *rootViewControllerView = [rootViewController.view snapshotViewAfterScreenUpdates:NO];
        self.rootViewController = viewController;
        [self.rootViewController.view addSubview:rootViewControllerView];
        
        [UIView transitionWithView:self
                          duration:0.5
                           options:options
                        animations:^{
                            [rootViewControllerView removeFromSuperview];
                        } completion:completion_];
    } else {
        self.rootViewController = viewController;
        completion_(YES);
    }
}

- (void)eln_dismissPresentedViewControllersForViewController:(UIViewController *)viewController completion:(void (^)())completion {
    if (viewController.presentedViewController == nil) {
        if (completion) {
            completion();
        }
    } else {
        __weak typeof(self) weakSelf = self;
        __weak typeof(viewController) weakViewController = viewController;
        [viewController dismissViewControllerAnimated:NO completion:^{
            [weakSelf eln_dismissPresentedViewControllersForViewController:weakViewController completion:completion];
        }];
    }
}

- (UIViewController *)eln_topViewController
{
    id topViewController = self.rootViewController;
    
    UIViewController *presentedController;
    while ((presentedController = [topViewController presentedViewController])
           && ![presentedController isKindOfClass:[UIAlertController class]]
           && ![presentedController isBeingDismissed])
    {
        topViewController = presentedController;
    }
    
    BOOL isTabBarController, isNavigationController;
    while ((isNavigationController = [topViewController isKindOfClass:[UINavigationController class]]) ||
           (isTabBarController = [topViewController isKindOfClass:[UITabBarController class]]))
    {
        if (isNavigationController) {
            topViewController = [topViewController topViewController];
        } else {
            topViewController = [topViewController selectedViewController];
        }
    }
    return topViewController;
}

@end
