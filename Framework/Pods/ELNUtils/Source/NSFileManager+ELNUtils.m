//
//  NSFileManager+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 14.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSFileManager+ELNUtils.h"

@implementation NSFileManager (ELNUtils)

- (NSURL *)eln_URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appendPathComponent:(NSString *)pathComponent create:(BOOL)create error:(NSError *__autoreleasing *)error {
    NSURL *rootDirectory = [self URLForDirectory:directory inDomain:domain appropriateForURL:nil create:create error:error];
    
    NSURL *URL;
    if (pathComponent != nil) {
        URL = [rootDirectory URLByAppendingPathComponent:pathComponent];
    } else {
        URL = rootDirectory;
    }
    
    if (create) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:URL.path isDirectory:NULL]) {
            if (![[NSFileManager defaultManager] createDirectoryAtURL:URL withIntermediateDirectories:YES attributes:nil error:error]) {
                return nil;
            }
        }
    }
    
    return URL;
}

@end
