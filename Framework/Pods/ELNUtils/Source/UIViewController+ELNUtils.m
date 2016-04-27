//
//  UIViewController+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 09.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIViewController+ELNUtils.h"

@implementation UIViewController (ELNChildViewControllerManagement)

- (void)eln_addChildViewController:(UIViewController *)viewController viewLoadBlock:(void (^)())viewLoadBlock {
    [self addChildViewController:viewController];
    if (viewLoadBlock) {
        viewLoadBlock();
    }
    [viewController didMoveToParentViewController:self];
}

- (void)eln_removeFromParentViewController {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)eln_clearSelectionOnViewWillAppearForView:(__kindof UIScrollView *)view {
    NSParameterAssert([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]);
    
    if ([view isKindOfClass:[UICollectionView class]]) {
        // collection view
        UICollectionView *collectionView = (UICollectionView *)view;
        
        NSArray *indexPaths = collectionView.indexPathsForSelectedItems;
        
        // deselect
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx, BOOL *stop) {
            [collectionView deselectItemAtIndexPath:obj animated:YES];
        }];
        
        [self eln_performTransitionCompletionHandlerWithBlock:^(BOOL cancelled) {
            if (cancelled)
                // select back
                [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx, BOOL *stop) {
                    [collectionView selectItemAtIndexPath:obj
                                                 animated:YES
                                           scrollPosition:UICollectionViewScrollPositionNone];
                }];
        }];
        
    } else if ([view isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)view;
        
        NSArray *indexPaths = tableView.indexPathsForSelectedRows;
        
        // deselect
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx, BOOL *stop) {
            [tableView deselectRowAtIndexPath:obj animated:YES];
        }];
        
        [self eln_performTransitionCompletionHandlerWithBlock:^(BOOL cancelled) {
            if (cancelled)
                // select back
                [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx, BOOL *stop) {
                    [tableView selectRowAtIndexPath:obj animated:YES scrollPosition:UITableViewScrollPositionNone];
                }];
        }];
    }
}

- (void)eln_performTransitionCompletionHandlerWithBlock:(void (^)(BOOL cancelled))completion {
    if (!completion)
        return;
    
    [self.transitionCoordinator notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        completion([context isCancelled]);
    }];
}

- (CGFloat)eln_topLayoutGuideLength {
    CGFloat topLayoutGuideLength;
    
    if (self.navigationController.navigationBar != nil) {
        topLayoutGuideLength = MAX(0, CGRectGetMaxY([self.navigationController.navigationBar convertRect:self.navigationController.navigationBar.bounds toView:self.view]));
    } else {
        CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
        topLayoutGuideLength = MIN(statusBarFrame.size.width, statusBarFrame.size.height);
    }
    
    return MAX(topLayoutGuideLength, [self.topLayoutGuide length]);
}


@end
