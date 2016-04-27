//
//  XCTestCase+ELNHelpers.m
//
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "XCTestCase+ELNHelpers.h"

@implementation XCTestCase (ELNHelpers)

- (void)eln_expectationWithDescription:(NSString * _Nonnull)description timeout:(NSTimeInterval)timeout block:(__nonnull ELNTestExpectationBlock)block {
    [self eln_expectationWithDescription:description timeout:timeout block:block completion:nil];
}

- (void)eln_expectationWithDescription:(NSString * _Nonnull)description timeout:(NSTimeInterval)timeout block:(__nonnull ELNTestExpectationBlock)block completion:(__nullable XCWaitCompletionHandler)completion {
    XCTestExpectation *expectation = [self expectationWithDescription:description];
    
    if (block) {
        block(expectation);
    }
    
    [self waitForExpectationsWithTimeout:timeout handler:completion];
}

@end
