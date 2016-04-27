//
//  NSBundle+ELNUtils.m
//  ELNUtils
//
//  Created by Dmitry Nesterenko on 22.03.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import "NSBundle+ELNUtils.h"

static NSString * const kBundleURLTypesKey = @"CFBundleURLTypes";
static NSString * const kBundleURLSchemesKey = @"CFBundleURLSchemes";
static NSString * const kBundleShortVersionStringKey = @"CFBundleShortVersionString";
static NSString * const kBundleDisplayNameKey = @"CFBundleDisplayName";
static NSString * const kBundleNameKey = @"CFBundleName";

@implementation NSBundle (ELNUtils)

- (NSArray *)eln_URLSchemes {
    id value;
    
    @try {
        value = [self.infoDictionary valueForKeyPath:[NSString stringWithFormat:@"%@.@unionOfArrays.%@", kBundleURLTypesKey, kBundleURLSchemesKey]];
    }
    @catch (__unused NSException *exception) {
        // do nothing, just ignore the error
    }
    
    return value;
}

- (NSString *)eln_version {
    return [self objectForInfoDictionaryKey:(__bridge NSString *)kCFBundleVersionKey];
}

- (NSString *)eln_shortVersion {
    return [self objectForInfoDictionaryKey:kBundleShortVersionStringKey];
}

- (NSString *)eln_displayName {
    return [self objectForInfoDictionaryKey:kBundleDisplayNameKey];
}

- (NSString *)eln_name {
    return [self objectForInfoDictionaryKey:kBundleNameKey];
}

@end
