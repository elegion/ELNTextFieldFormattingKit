//
//  UIMotionEffect+ELNUtils.m
//  ELNUtils
//
//  Created by Dmitry Nesterenko on 04.04.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import "UIMotionEffect+ELNUtils.h"

@implementation UIMotionEffect (ELNUtils)

+ (instancetype)eln_tiltWithOffset:(UIOffset)offset {
    UIInterpolatingMotionEffect *horizontal = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontal.minimumRelativeValue = @(-offset.horizontal);
    horizontal.maximumRelativeValue = @(offset.horizontal);
    
    UIInterpolatingMotionEffect *vertical = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    vertical.minimumRelativeValue = @(-offset.vertical);
    vertical.maximumRelativeValue = @(offset.vertical);
    
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontal, vertical];
    
    return group;
}

@end
