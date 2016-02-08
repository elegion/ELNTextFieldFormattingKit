//
//  ELNCurrencyFormatter.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

/**
 *  Custom currency formatter for application
 */
@interface ELNCurrencyFormatter : NSFormatter

/**
 *  Default value is russian locale.
 */
@property (nonatomic, copy) NSLocale *locale;
/**
 *  Default currency code is RUB
 */
@property (nonatomic, copy) NSString *currencyCode;
/**
 *  Reduces fraction digits to have as minimum length as it can. Default value is NO.
 */
@property (nonatomic, assign) BOOL shouldReduceFractionDigits;

@property (nonatomic, assign) NSUInteger maximumIntegerDigits;
@property (nonatomic, copy) NSString *decimalSeparator;

- (NSString *)stringFromNumber:(NSNumber *)number;
- (NSNumber *)numberFromString:(NSString *)string;

@end
