//
//  ELNAmountValidator.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import "ELNCharactersValidator.h"

@interface ELNAmountValidator : ELNCharactersValidator

@property (nonatomic, strong, readonly, nullable) NSCharacterSet *punctuationCharacterSet;

/**
 *  Default integer part length is 15 digits
 */
@property (nonatomic, assign) NSUInteger maxIntegerLength;
/**
 *  Default fractional part length is 2 digits
 */
@property (nonatomic, assign) NSUInteger maxFractionalLength;

@property (nonatomic, strong, nullable) NSNumber *maxValue;

@end
