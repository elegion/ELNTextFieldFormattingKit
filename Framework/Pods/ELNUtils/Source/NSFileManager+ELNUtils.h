//
//  NSFileManager+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 14.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

@interface NSFileManager (ELNUtils)

/// Creates a specified directory in a specified domain by appending path component.
- (NSURL *)eln_URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appendPathComponent:(NSString *)pathComponent create:(BOOL)create error:(NSError **)error;

@end
