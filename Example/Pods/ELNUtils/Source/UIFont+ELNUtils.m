//
//  UIFont+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 12.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIFont+ELNUtils.h"

@implementation UIFont (ELNHelpers)

+ (UIFont *)eln_semiboldSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpartial-availability"
        return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
#pragma clang diagnostic pop
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
    }
}

+ (UIFont *)eln_mediumSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpartial-availability"
        return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
#pragma clang diagnostic pop
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
    }
}

+ (UIFont *)eln_lightSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpartial-availability"
        return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
#pragma clang diagnostic pop
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
    }
}

+ (UIFont *)eln_thinSystemFontOfSize:(CGFloat)size {
    if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpartial-availability"
        return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
#pragma clang diagnostic pop
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
    }
}

@end
