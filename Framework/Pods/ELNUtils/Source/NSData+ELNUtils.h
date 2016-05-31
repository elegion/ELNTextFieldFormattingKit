//
//  NSData+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 21.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (ELNMD5)

/// Returns MD5 hash for data.
- (NSString *)eln_MD5;

@end

NS_ASSUME_NONNULL_END
