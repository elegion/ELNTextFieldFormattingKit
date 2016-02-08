//
//  NSError+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 05.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSError+ELNUtils.h"

@implementation NSError (ELNUtils)

- (NSString *)eln_localizedDescription {
    NSString *result;
    if ([self eln_isNetworkError]) {
        NSString *key = @"error.network.unavailable";
        result = NSLocalizedString(key, nil);
        if (![result isEqualToString:key]) {
            return result;
        }
    }
    
    return self.localizedDescription;
}

- (BOOL)eln_isNetworkError {
    if (![self.domain isEqualToString:NSURLErrorDomain]) {
        return NO;
    }
    
    NSError *underlyingError = self.userInfo[NSUnderlyingErrorKey];
    if ([underlyingError eln_isNetworkError]) {
        return YES;
    }
    
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
        default:
            return NO;
    }
}

- (BOOL)eln_isNetworkOperationCancelledError {
    return [self eln_matchesDomain:NSURLErrorDomain code:NSURLErrorCancelled]
    || [self eln_matchesDomain:NSCocoaErrorDomain code:NSUserCancelledError];
}

- (BOOL)eln_matchesDomain:(NSString *)domain code:(NSInteger)code {
    return [self.domain isEqualToString:domain] && self.code == code;
}

@end
