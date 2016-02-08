//
//  UIFont+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 12.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIFont+ELNUtils.h"

@implementation UIFont (ELNUtils)

+ (UIFont *)eln_semiboldSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
    }
}

+ (UIFont *)eln_mediumSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
    }
}

+ (UIFont *)eln_lightSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
    }
}

+ (UIFont *)eln_thinSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
    }
}

@end
