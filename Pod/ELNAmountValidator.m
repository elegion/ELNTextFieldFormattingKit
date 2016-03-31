//
//  ELNAmountValidator.m
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <ELNUtils/NSString+ELNUtils.h>

#import "ELNAmountValidator.h"

@interface ELNAmountValidator ()

@property (nonatomic, strong) NSCharacterSet *punctuationCharacterSet;
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

@end

@implementation ELNAmountValidator

- (instancetype)init {
    self = [super init];
    if (self) {
        self.punctuationCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@",."];
        
        NSMutableCharacterSet *allowedCharacters = [NSMutableCharacterSet decimalDigitCharacterSet];
        [allowedCharacters formUnionWithCharacterSet:self.punctuationCharacterSet];
        
        self.allowedCharacterSet = [allowedCharacters copy];
        
        self.maxIntegerLength = 15;
        self.maxFractionalLength = 2;
        
        _numberFormatter = [NSNumberFormatter new];
    }
    return self;
}

- (BOOL)isValid:(id)value allowsEmpty:(BOOL)allowsEmpty error:(NSError *__autoreleasing *)error {
    if (![super isValid:value allowsEmpty:allowsEmpty error:error]) {
        return NO;
    }
    
    NSString *string = value;
    
    NSArray<NSString *> *components = [string componentsSeparatedByCharactersInSet:self.punctuationCharacterSet];
    if (components.count > (self.maxFractionalLength > 0 ? 2 : 1)) {
        return NO;
        
    } else if (components.count == 2) {
        if (components.lastObject.length > self.maxFractionalLength) {
            return NO;
        }
    }
    
    if (components.firstObject.length > self.maxIntegerLength) {
        return NO;
    }
    
    if (self.maxValue) {
        NSNumber *numberValue = [self.numberFormatter numberFromString:string];
        if(numberValue && [self.maxValue compare:numberValue] == NSOrderedAscending) {
            return NO;
        }
    }
    
    return YES;
}

@end
