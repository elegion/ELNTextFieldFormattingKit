//
//  NSLocale+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 28.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

@interface NSLocale (ELNUtils)

/** 
 Return locale for main bundle's most preferred localization
 Often preferred localization language and current locale differs. So in order to properly format 
 numbers and dates you should use this method to obtain user's current UI language.
 */
+ (NSLocale *)eln_localeForPreferredLocalization;

@end
