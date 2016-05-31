//
//  ELNCompositeValidator.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 26.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNCompositeValidator.h"

@interface ELNCompositeValidator ()

@property (nonatomic, strong) NSArray *validators;

@end

@implementation ELNCompositeValidator

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.validators = @[];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) copy = [self.class new];
    return copy;
}

#pragma mark - Validation

- (void)addValidator:(id<ELNValidatorType>)validator {
    self.validators = [self.validators arrayByAddingObject:validator];
}

- (BOOL)isValid:(id)value error:(NSError *__autoreleasing *)error {
    for (id<ELNValidatorType> validator in self.validators) {
        if ([validator conformsToProtocol:@protocol(ELNValidatorType)]) {
            if (![validator isValid:value error:error]) {
                return NO;
            }
        }
    }
    return YES;
}

@end
