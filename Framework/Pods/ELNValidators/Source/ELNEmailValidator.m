//
//  ELNEmailValidator.m
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import "ELNEmailValidator.h"

@implementation ELNEmailValidator

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) copy = [self.class new];
    return copy;
}

- (BOOL)isValid:(id)value error:(NSError *__autoreleasing *)error {
    if (![value isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    NSString *string = value;
    
    NSArray<NSString *> *components = [string componentsSeparatedByString:@"@"];
    if (components.count != 2) {
        return NO;
    }
    
    return YES;
}

@end
