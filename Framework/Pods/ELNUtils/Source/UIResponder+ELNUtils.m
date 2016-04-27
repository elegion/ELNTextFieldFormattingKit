//
//  UIResponder+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 10.12.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIResponder+ELNUtils.h"

static __weak id currentFirstResponder;

@implementation UIResponder (ELNUtils)

+ (UIResponder *)eln_currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(eln_findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

- (void)eln_findFirstResponder:(id)sender {
    currentFirstResponder = self;
}

@end
