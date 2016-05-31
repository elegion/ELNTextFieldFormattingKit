//
//  ELNAmountValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 25.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNStringLengthValidator.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const ELNAmountValidatorErrorDomain;

typedef NS_ENUM(NSInteger, ELNAmountValidatorError) {
    ELNAmountValidatorErrorInvalidType = 1,
    ELNAmountValidatorErrorNotANumber,
    ELNAmountValidatorErrorFractionNotAllowed,
    ELNAmountValidatorErrorIntegerLengthExceeded,
    ELNAmountValidatorErrorFractionalLengthExceeded,
    ELNAmountValidatorErrorMaximumValueExceeded
};

@interface ELNAmountValidator : NSObject <ELNValidatorType>

/// Includes "." and "," character
@property (nonatomic, strong, readonly) NSCharacterSet *punctuationCharacterSet;

/// Union of decimal character set and punctuation character set
@property (nonatomic, strong, readonly) NSCharacterSet *allowedCharacterSet;

/// Default integer part length is 15 digits
@property (nonatomic, assign) NSUInteger maximumIntegerLength;

/// Default fractional part length is 2 digits
@property (nonatomic, assign) NSUInteger maximumFractionalLength;

/// Default value is nil
@property (nonatomic, strong, nullable) NSNumber *maxValue;

/// Number formatter is used to validate maxValue
@property (nonatomic, strong, readonly) NSNumberFormatter *numberFormatter;

@end

NS_ASSUME_NONNULL_END
