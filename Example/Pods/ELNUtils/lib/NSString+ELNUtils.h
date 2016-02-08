//
//  NSString+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 14.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

@interface NSString (ELNUtils)

/// Checks if specified characters are contained in string.
- (BOOL)eln_containsCharactersInSet:(NSCharacterSet *)characterSet;
/// Removes specified characters from string
- (NSString *)eln_stringByRemovingCharactersInSet:(NSCharacterSet *)characterSet;

/// Returns a string with first letter uppercased.
- (NSString *)eln_uppercaseFirstLetterString;
/// Returns number value from decimal number strings.
- (NSNumber *)eln_numberValue;

@end


@interface NSString (ELNLocalization)

/**
 Returns an NSString object initialized by using a given format string as a template
 into which the remaining argument values are substituted according to given locale information.
 
 Fixes iOS9 compatibility.
 
 @see http://maniak-dobrii.com/understanding-ios-internationalization/
 */
+ (NSString *)eln_localizedStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

@end


@interface NSString (ELNMD5)

/// Returns MD5 hash from UTF8 string.
- (NSString *)eln_MD5;

@end
