//
//  NSBundle+ELNUtils.h
//  ELNUtils
//
//  Created by Dmitry Nesterenko on 22.03.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (ELNUtils)

/**
 Returns a union of CFBundleURLSchemes values declared in bundle's plist.
 */
- (nullable NSArray *)eln_URLSchemes;

/// Returns a value for kCFBundleVersionKey key decalred in bundle's plist.
- (nullable NSString *)eln_version;

/// Returns a value for CFBundleShortVersionString key declared in bundle's plist.
- (nullable NSString *)eln_shortVersion;

/// Returns a value for CFBundleDisplayName key declared in bundle's plist.
- (nullable NSString *)eln_displayName;

/// Returns a value for CFBundleName key declared in bundle's plist.
- (nullable NSString *)eln_name;

- (nullable id)eln_objectForInfoDictionaryKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
