//
//  NSString+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 14.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

@interface NSString (ELNUtils)

/// Removes specified characters from string
- (NSString *)eln_stringByRemovingCharactersInSet:(NSCharacterSet *)characterSet;

/// Returns a string with first letter uppercased.
- (NSString *)eln_uppercaseFirstLetterString;

/// Returns number value from decimal number strings.
- (NSNumber *)eln_numberValue;

/**
 Returns an NSString object initialized by using a given format string as a template
 into which the remaining argument values are substituted according to given locale information.
 
 Fixes iOS9 compatibility.
 
 @see http://maniak-dobrii.com/understanding-ios-internationalization/
 */
+ (NSString *)eln_localizedStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

- (CGRect)eln_boundingRectWithSize:(CGSize)size font:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLines:(NSInteger)numberOfLines;

@end
