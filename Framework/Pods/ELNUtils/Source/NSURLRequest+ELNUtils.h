//
//  NSURLRequest+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 13.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (ELNUtils)

/// Returns curl formatted string for request.
- (NSString *)eln_CURL;

@end

NS_ASSUME_NONNULL_END
