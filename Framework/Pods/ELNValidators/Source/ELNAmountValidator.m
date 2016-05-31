//
//  ELNAmountValidator.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 25.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNAmountValidator.h"
#import "ELNCharactersValidator.h"

NSString * const ELNAmountValidatorErrorDomain = @"com.e-legion.validator.amount.error";

@interface ELNAmountValidator ()

@property (nonatomic, strong) ELNCharactersValidator *charactersValidator;
@property (nonatomic, strong) NSCharacterSet *punctuationCharacterSet;
@property (nonatomic, strong) NSCharacterSet *allowedCharacterSet;
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

@end

@implementation ELNAmountValidator

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.punctuationCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@",."];
        
        NSMutableCharacterSet *allowedCharacterSet = [NSMutableCharacterSet decimalDigitCharacterSet];
        [allowedCharacterSet formUnionWithCharacterSet:self.punctuationCharacterSet];
        self.allowedCharacterSet = [allowedCharacterSet copy];
        
        self.charactersValidator = [[ELNCharactersValidator alloc] initWithAllowedCharacterSet:allowedCharacterSet];
        
        self.maximumIntegerLength = 15;
        self.maximumFractionalLength = 2;
        
        self.numberFormatter = [NSNumberFormatter new];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) copy = [self.class new];
    copy.maximumIntegerLength = self.maximumIntegerLength;
    copy.maximumFractionalLength = self.maximumFractionalLength;
    copy.charactersValidator = self.charactersValidator;
    copy.punctuationCharacterSet = self.punctuationCharacterSet;
    copy.numberFormatter = self.numberFormatter;
    return copy;
}

#pragma mark - Validation

- (BOOL)isValid:(id)value error:(NSError *__autoreleasing *)error {
    if (![value isKindOfClass:[NSString class]]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNAmountValidatorErrorDomain code:ELNAmountValidatorErrorInvalidType userInfo:nil];
        }
        return NO;
    }

    NSString *string = value;
    
    NSArray<NSString *> *components = [string componentsSeparatedByCharactersInSet:self.punctuationCharacterSet];
    
    if (self.maximumFractionalLength == 0 && components.count == 2) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNAmountValidatorErrorDomain code:ELNAmountValidatorErrorFractionNotAllowed userInfo:nil];
        }
        return NO;
    }
    
    if (components.count > (self.maximumFractionalLength > 0 ? 2 : 1)) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNAmountValidatorErrorDomain code:ELNAmountValidatorErrorNotANumber userInfo:nil];
        }
        return NO;
        
    } else if (components.count == 2) {
        if (components.lastObject.length > self.maximumFractionalLength) {
            if (error != NULL) {
                *error = [NSError errorWithDomain:ELNAmountValidatorErrorDomain code:ELNAmountValidatorErrorFractionalLengthExceeded userInfo:nil];
            }
            return NO;
        }
    }
    
    if (components.firstObject.length > self.maximumIntegerLength) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNAmountValidatorErrorDomain code:ELNAmountValidatorErrorIntegerLengthExceeded userInfo:nil];
        }
        return NO;
    }

    if (self.maxValue) {
        NSNumber *numberValue = [self.numberFormatter numberFromString:string];
        if (numberValue && [self.maxValue compare:numberValue] == NSOrderedAscending) {
            if (error != NULL) {
                *error = [NSError errorWithDomain:ELNAmountValidatorErrorDomain code:ELNAmountValidatorErrorMaximumValueExceeded userInfo:nil];
            }
            return NO;
        }
    }
    
    return YES;
}

@end
