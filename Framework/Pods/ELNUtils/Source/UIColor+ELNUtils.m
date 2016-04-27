//
//  UIColor+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 27.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIColor+ELNUtils.h"

@implementation UIColor (ELNUtils)

+ (UIColor *)eln_colorWithHex:(unsigned)hex {
    CGFloat r = ((hex & 0xFF0000) >> 16) / 255.;
    CGFloat g = ((hex & 0xFF00) >> 8) / 255.;
    CGFloat b = (hex & 0xFF) / 255.;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (NSString *)eln_hex {
    CGColorSpaceModel colorSpace = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r, g, b;
    
    if (colorSpace == kCGColorSpaceModelMonochrome) {
        r = components[0];
        g = components[0];
        b = components[0];
    } else {
        r = components[0];
        g = components[1];
        b = components[2];
    }
    
    return [NSString stringWithFormat:@"%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];
}

+ (UIColor *)eln_colorWithHexString:(NSString *)hexString {
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSAssert(hexString.length == 6, @"Wrong hex string length.");
    
    unsigned rgbHex;
    [[[NSScanner alloc] initWithString:hexString] scanHexInt:&rgbHex];
    return [UIColor eln_colorWithHex:rgbHex];
}

- (UIColor *)eln_blendWithColor:(UIColor *)color alpha:(CGFloat)alpha {
    alpha = MIN(1, MAX(0, alpha));
    CGFloat beta = 1 - alpha;
    
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    
    [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    CGFloat r = r1 * beta + r2 * alpha;
    CGFloat g = g1 * beta + g2 * alpha;
    CGFloat b = b1 * beta + b2 * alpha;
    CGFloat a = a1 * beta + a2 * alpha;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
