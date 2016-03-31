//
//  Copyright (c) 2016 E-Legion. All rights reserved.
//

@import UIKit;

/** 
 UIView category for easy manual layout.
 */
@interface UIView (ELNLayoutUtils)

@property (readwrite, nonatomic) CGFloat originX;
@property (readwrite, nonatomic) CGFloat originY;
@property (readwrite, nonatomic) CGFloat height;
@property (readwrite, nonatomic) CGFloat width;

@property (readonly, nonatomic) CGFloat minX;
@property (readonly, nonatomic) CGFloat maxX;
@property (readonly, nonatomic) CGFloat minY;
@property (readonly, nonatomic) CGFloat maxY;
@property (readonly, nonatomic) CGFloat midX;
@property (readonly, nonatomic) CGFloat midY;

/// Add x to origin.x and y to origin.y.
- (void)eln_shiftByX:(CGFloat)x y:(CGFloat)y;

- (void)eln_moveTrailingToView:(UIView*)view withXOffset:(CGFloat)offset;
- (void)eln_moveLowerThanView:(UIView*)view withYOffset:(CGFloat)offset;

- (void)eln_centerInSuperview;
- (void)eln_centerInSuperviewHorizontally;
- (void)eln_centerInSuperviewVertically;

/// Set width equal to max X of specified subview + inset.
- (void)eln_setWidthToFitSubview:(UIView *)subview withXInset:(CGFloat)inset;
/// Set height equal to max Y of specified subview + inset.
- (void)eln_setHeightToFitSubview:(UIView *)subview withYInset:(CGFloat)inset;

/// Apply CGRectIntegral to frame.
- (void)eln_setIntegralFrame;

@end


/** 
 UIScrollView category for easy manual layout.
 */
@interface UIScrollView (ELNLayoutUtils)

- (void)eln_setWidthEqualToContent;
- (void)eln_setHeightEqualToContent;

/// Set content width equal to max X of specified subview + inset.
- (void)eln_setContentWidthToFitSubview:(UIView *)subview withXInset:(CGFloat)inset;
/// Set content height equal to max Y of specified subview + inset.
- (void)eln_setContentHeightToFitSubview:(UIView *)subview withYInset:(CGFloat)inset;
/// Set content size equal to max X and Y of subviews.
- (void)eln_setContentSizeToFitSubviews;
/// Set content size equal to max X and Y of subviews + inset.
- (void)eln_setContentSizeToFitSubviewsWithInset:(CGSize)inset;

@end
