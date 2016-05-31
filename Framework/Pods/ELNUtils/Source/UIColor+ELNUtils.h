//
//  UIColor+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 27.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ELNUtils)

+ (UIColor *)eln_colorWithHex:(unsigned)hex;

- (NSString *)eln_hex;

+ (UIColor *)eln_colorWithHexString:(NSString *)hexString;

- (UIColor *)eln_blendWithColor:(UIColor *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
