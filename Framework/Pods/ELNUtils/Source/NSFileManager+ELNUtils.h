//
//  NSFileManager+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 14.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (ELNUtils)

/// Creates a specified directory in a specified domain by appending path component.
- (nullable NSURL *)eln_URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appendPathComponent:(nullable NSString *)pathComponent create:(BOOL)create error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
