//
//  UIView+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 13.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UIView+ELNUtils.h"

@implementation UIView (ELNUtils)

- (void)eln_wobble {
    [self eln_wobbleWithDuration:0.25 amplitude:7.0 frequency:8];
}

- (void)eln_wobbleWithDuration:(NSTimeInterval)time amplitude:(NSInteger)amplitude frequency:(NSInteger)frequency {
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    NSMutableArray * values = [NSMutableArray arrayWithCapacity:100];
    
    // fr + amplitude * sinf(M_PI_2 * t * frequency) * (1 - t)
    // fr + amplitude * (sinf(M_PI_2 * t * frequency) / expf(M_PI_2 * t))
    
    for(float t = 0, fr = [[self.layer valueForKeyPath:@"position.x"] floatValue]; t <= 1; t+= .01)
        [values addObject:[NSNumber numberWithFloat:fr + amplitude * (sinf(M_PI_2 * t * frequency) / expf(M_PI_2 * t))]];
    
    [animation setValues:values];
    [animation setDuration:time];
    
    [self.layer addAnimation:animation forKey:@"WobbleAnimation"];
}

- (__kindof UIView *)eln_superviewWithClass:(Class)superviewClass {
    UIView *view = self;
    while (view.superview != nil) {
        view = view.superview;
        if ([view isKindOfClass:superviewClass])
            break;
    }
    
    return view == self ? nil : view;
}

@end
