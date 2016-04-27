//
//  NSLocale+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 28.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSLocale+ELNUtils.h"

@implementation NSLocale (ELNUtils)

+ (NSLocale *)eln_localeForPreferredLocalization {
    return [NSLocale localeWithLocaleIdentifier:[NSBundle mainBundle].preferredLocalizations.firstObject];
}

@end
