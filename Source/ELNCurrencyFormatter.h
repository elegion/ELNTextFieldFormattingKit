//
//  ELNCurrencyFormatter.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  Custom currency formatter for application
 */
@interface ELNCurrencyFormatter : NSFormatter

/**
 *  Default value is russian locale.
 */
@property (nonatomic, copy, nullable) NSLocale *locale;
/**
 *  Default currency code is RUB
 */
@property (nonatomic, copy, nullable) NSString *currencyCode;
/**
 *  Reduces fraction digits to have as minimum length as it can. Default value is NO.
 */
@property (nonatomic, assign) BOOL shouldReduceFractionDigits;

@property (nonatomic, assign) NSUInteger maximumIntegerDigits;
@property (nonatomic, copy, null_resettable) NSString *decimalSeparator;

- (nullable NSString *)stringFromNumber:(nullable NSNumber *)number;
- (nullable NSNumber *)numberFromString:(nullable NSString *)string;

@end

NS_ASSUME_NONNULL_END
