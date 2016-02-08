//
//  UIColor+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 27.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIColor+ELNUtils.h"

@implementation UIColor (ELNUtils)

+ (UIColor *)eln_colorWithHex:(unsigned)hex
{
    CGFloat r = ((hex & 0xFF0000) >> 16) / 255.;
    CGFloat g = ((hex & 0xFF00) >> 8) / 255.;
    CGFloat b = (hex & 0xFF) / 255.;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

+ (UIColor *)eln_colorWithHexString:(NSString *)hexString
{
    NSAssert([hexString isKindOfClass:[NSString class]], @"Wrong parameter type.");
    
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSAssert(hexString.length == 6, @"Wrong hex string length.");
    
    unsigned rgbHex;
    [[[NSScanner alloc] initWithString:hexString] scanHexInt:&rgbHex];
    return [UIColor eln_colorWithHex:rgbHex];
}

@end
