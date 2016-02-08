//
//  NSString+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 14.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSString+ELNUtils.h"
#import "NSLocale+ELNUtils.h"
#import "NSData+ELNUtils.h"

@implementation NSString (ELNUtils)

- (BOOL)eln_containsCharactersInSet:(NSCharacterSet *)characterSet {
    return [self eln_stringByRemovingCharactersInSet:characterSet].length != self.length;
}

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

@end


@implementation NSString (ELNLocalization)

+ (NSString *)eln_localizedStringWithFormat:(NSString *)format, ... {
    NSLocale *locale = [NSLocale eln_localeForPreferredLocalization];
    
    va_list ap;
    va_start(ap, format);
    return [[NSString alloc] initWithFormat:format locale:locale arguments:ap];
}

@end


@implementation NSString (ELNMD5)

- (NSString *)eln_MD5 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] eln_MD5];
}

@end
