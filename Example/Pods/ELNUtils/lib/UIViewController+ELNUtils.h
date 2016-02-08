//
//  UIViewController+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 09.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

@interface UIViewController (ELNChildViewControllerManagement)

/** 
 Adds self as child view controller with specified view block.
 You must layout and attach subviews by yourself in `viewLoadBlock`.
 */
- (void)eln_addChildViewController:(UIViewController *)viewController viewLoadBlock:(void (^)())viewLoadBlock;

/// Removes self view controller from parent view controller in containment hierarchy.
- (void)eln_removeFromParentViewController;

@end


@interface UIViewController (ELNUtils)

/// Interactive transition selection cleaner for UITableView and UICollectionView instances.
- (void)eln_clearSelectionOnViewWillAppearForView:(__kindof UIScrollView *)view;

/// Interactive transition completion handler.
- (void)eln_performTransitionCompletionHandlerWithBlock:(void (^)(BOOL cancelled))completion;

@end
