//
//  ELNAmountValidator.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import "ELNCharactersValidator.h"

@interface ELNAmountValidator : ELNCharactersValidator

@property (nonatomic, strong, readonly) NSCharacterSet *punctuationCharacterSet;

/**
 *  Default integer part length is 15 digits
 */
@property (nonatomic, assign) NSUInteger maxIntegerLength;
/**
 *  Default fractional part length is 2 digits
 */
@property (nonatomic, assign) NSUInteger maxFractionalLength;

@property (nonatomic, strong) NSNumber *maxValue;

@end
