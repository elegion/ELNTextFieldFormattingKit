//
//  NSString+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 14.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSString+ELNUtils.h"
#import "NSLocale+ELNUtils.h"
#import "ELNMath.h"

@implementation NSString (ELNUtils)

- (NSString *)eln_stringByRemovingCharactersInSet:(NSCharacterSet *)characterSet {
    return [[self componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString:@""];
}

- (NSString *)eln_uppercaseFirstLetterString {
    NSString *firstLetter = [[self substringToIndex:MIN(1u, self.length)] uppercaseString];
    return [firstLetter stringByAppendingString:[self substringFromIndex:MIN(1u, self.length)]];
}

- (NSNumber *)eln_numberValue {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSNumber *number = [formatter numberFromString:self];
    
    if (number == nil) {
        formatter.decimalSeparator = @".";
        number = [formatter numberFromString:self];
    }
    
    if (number == nil) {
        formatter.decimalSeparator = @",";
        number = [formatter numberFromString:self];
    }
    
    return number;
}

+ (NSString *)eln_localizedStringWithFormat:(NSString *)format, ... {
    NSLocale *locale = [NSLocale eln_localeForPreferredLocalization];
    
    va_list ap;
    va_start(ap, format);
    return [[NSString alloc] initWithFormat:format locale:locale arguments:ap];
}

- (CGRect)eln_boundingRectWithSize:(CGSize)size font:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLines:(NSInteger)numberOfLines {
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    // font
    if (font) {
        attributes[NSFontAttributeName] = font;
    }
    
    // linebreak mode
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = lineBreakMode;
    attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    
    // options
    NSStringDrawingOptions options = numberOfLines != 1 ? NSStringDrawingUsesLineFragmentOrigin : NSStringDrawingTruncatesLastVisibleLine;
    
    CGRect rect = [self boundingRectWithSize:size options:options attributes:attributes context:nil];
    rect.size.width =  eln_ceil(rect.size.width);
    rect.size.height =  eln_ceil(rect.size.height);
    
    return rect;
}

@end
