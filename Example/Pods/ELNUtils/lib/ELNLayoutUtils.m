//
//  Copyright (c) 2016 E-Legion. All rights reserved.
//

#import "ELNLayoutUtils.h"

@implementation UIView (ELNLayoutUtils)

- (CGFloat)originX
{
    return self.frame.origin.x;
}

- (void)setOriginX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)minX
{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)minY
{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)midX
{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)midY
{
    return CGRectGetMidY(self.frame);
}

- (void)eln_shiftByX:(CGFloat)x y:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.x += x;
    frame.origin.y += y;
    self.frame = frame;
}

- (void)eln_moveTrailingToView:(UIView *)view withXOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMaxX(view.frame) + offset;
    self.frame = frame;
}

- (void)eln_moveLowerThanView:(UIView *)view withYOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.y = CGRectGetMaxY(view.frame) + offset;
    self.frame = frame;
}

- (void)eln_centerInSuperview
{
    self.center = CGPointMake(floorf(self.superview.bounds.size.width/2),
                              floorf(self.superview.bounds.size.height/2));
}

- (void)eln_centerInSuperviewHorizontally
{
    self.center = CGPointMake(floorf(self.superview.bounds.size.width/2),
                              self.center.y);
}

- (void)eln_centerInSuperviewVertically
{
    self.center = CGPointMake(self.center.x,
                              floorf(self.superview.bounds.size.height/2));
}

- (void)eln_setWidthToFitSubview:(UIView *)subview withXInset:(CGFloat)inset
{
    NSAssert(subview.superview == self, @"Specified view must be a subview.");
    self.width = subview.maxX + inset;
}

- (void)eln_setHeightToFitSubview:(UIView *)subview withYInset:(CGFloat)inset
{
    NSAssert(subview.superview == self, @"Specified view must be a subview.");
    self.height = subview.maxY + inset;
}

- (void)eln_setIntegralFrame
{
    self.frame = CGRectIntegral(self.frame);
}

@end


@implementation UIScrollView (ELNLayoutUtils)

- (void)eln_setWidthEqualToContent
{
    self.width = self.contentSize.width;
}

- (void)eln_setHeightEqualToContent
{
    self.height = self.contentSize.height;
}

- (void)eln_setContentWidthToFitSubview:(UIView *)subview withXInset:(CGFloat)inset
{
    NSAssert([self.subviews containsObject:subview], @"Subview parameter value is not really subview.");
    self.contentSize = CGSizeMake(CGRectGetMaxX(subview.frame) + inset,
                                  self.contentSize.height);
}

- (void)eln_setContentHeightToFitSubview:(UIView *)subview withYInset:(CGFloat)inset
{
    NSAssert([self.subviews containsObject:subview], @"Subview parameter value is not really subview.");
    self.contentSize = CGSizeMake(self.contentSize.width,
                                  CGRectGetMaxY(subview.frame));
}

- (void)eln_setContentSizeToFitSubviews
{
    [self eln_setContentSizeToFitSubviewsWithInset:CGSizeZero];
}

- (void)eln_setContentSizeToFitSubviewsWithInset:(CGSize)inset
{
    CGFloat maxX = [[self.subviews valueForKeyPath:@"@max.maxX"] floatValue];
    CGFloat maxY = [[self.subviews valueForKeyPath:@"@max.maxY"] floatValue];
    self.contentSize = CGSizeMake(maxX + inset.width,
                                  maxY + inset.height);
}

@end
