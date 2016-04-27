//
//  NSError+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 05.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSError+ELNUtils.h"

@implementation NSError (ELNUtils)

- (BOOL)eln_isNetworkConnectionError {
    if ([self.domain isEqualToString:NSURLErrorDomain]) {
        switch (self.code) {
            case NSURLErrorTimedOut:
            case NSURLErrorCannotFindHost:
            case NSURLErrorCannotConnectToHost:
            case NSURLErrorNetworkConnectionLost:
            case NSURLErrorDNSLookupFailed:
            case NSURLErrorNotConnectedToInternet:
            case NSURLErrorInternationalRoamingOff:
            case NSURLErrorCallIsActive:
            case NSURLErrorDataNotAllowed:
                return YES;
        }
    }
    NSError *underlyingError = self.userInfo[NSUnderlyingErrorKey];
    return underlyingError.eln_isNetworkConnectionError;
}

- (BOOL)eln_isNetworkCancelledError {
    return [self eln_matchesDomain:NSURLErrorDomain codes:@[@(NSURLErrorCancelled)]];
}

- (BOOL)eln_matchesDomain:(NSString *)domain codes:(NSArray<NSNumber *> *)codes {
    if (![self.domain isEqualToString:domain]) {
        return NO;
    }
    
    for (NSNumber *code in codes) {
        if (self.code == code.integerValue) {
            return YES;
        }
    }
    
    return NO;
}

@end
