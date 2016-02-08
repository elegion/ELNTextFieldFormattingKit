//
//  ELNCharactersValidator.m
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <ELNUtils/NSString+ELNUtils.h>

#import "ELNCharactersValidator.h"

@implementation ELNCharactersValidator

#pragma mark - Initialization

- (instancetype)initWithAllowedCharacterSet:(NSCharacterSet *)allowedCharacterSet {
    self = [super init];
    if (self) {
        self.allowedCharacterSet = allowedCharacterSet;
        self.allowsEmpty = YES;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) copy = [self.class new];
    copy.allowsEmpty = self.allowsEmpty;
    copy.allowedCharacterSet = self.allowedCharacterSet;
    return copy;
}

#pragma mark - Validation

- (BOOL)isValid:(id)value error:(NSError *__autoreleasing *)error {
    return [self isValid:value allowsEmpty:self.allowsEmpty error:error];
}

- (BOOL)isValid:(id)value allowsEmpty:(BOOL)allowsEmpty error:(NSError *__autoreleasing *)error {
    if (![value isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    NSString *string = value;
    
    if (!allowsEmpty && string.length == 0) {
        return NO;
    }
    
    if (self.allowedCharacterSet == nil) {
        return YES;
    }
    
    BOOL containsInvalidCharacters = [string eln_containsCharactersInSet:[self.allowedCharacterSet invertedSet]];
    return !containsInvalidCharacters;
}

@end
