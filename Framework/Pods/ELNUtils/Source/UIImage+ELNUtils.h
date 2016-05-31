//
//  UIImage+ELNUtils.h
//  Megafon
//
//  Created by Alexander Malnev on 08/12/15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ELNUtils)

/// Create image with specified size using block for drawing content.
+ (UIImage *)eln_imageWithSize:(CGSize)size drawingBlock:(void (^ _Nullable)(CGRect rect, CGContextRef context))drawing;

/// Create 1x1 px transparent image with specified color.
+ (UIImage *)eln_imageWithColor:(UIColor *)color;

/// Create transparent oval image with specified size and color.
+ (UIImage *)eln_ovalImageWithSize:(CGSize)size color:(UIColor *)color fill:(BOOL)fill;

/// Render mask alpha image with specified color like system type buttons do.
+ (UIImage *)eln_alphaImageNamed:(NSString *)name blendedWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
