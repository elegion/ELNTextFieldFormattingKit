//
//  XCTestCase+ELNHelpers.h
//
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <XCTest/XCTest.h>

typedef void (^ELNTestExpectationBlock)(XCTestExpectation * _Nonnull expectation);

@interface XCTestCase (ELNHelpers)

- (void)eln_expectationWithDescription:(NSString * _Nonnull)description timeout:(NSTimeInterval)timeout block:(__nonnull ELNTestExpectationBlock)block;
- (void)eln_expectationWithDescription:(NSString * _Nonnull)description timeout:(NSTimeInterval)timeout block:(__nonnull ELNTestExpectationBlock)block completion:(__nullable XCWaitCompletionHandler)completion;

@end
