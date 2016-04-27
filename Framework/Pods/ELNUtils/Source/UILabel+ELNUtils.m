//
//  UILabel+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 16.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UILabel+ELNUtils.h"
#import "NSString+ELNUtils.h"

@implementation UILabel (ELNUtils)

- (CGSize)eln_sizeThatFits:(CGSize)size {
    if (self.text != nil) {
        return [self.text eln_boundingRectWithSize:size font:self.font lineBreakMode:self.lineBreakMode numberOfLines:self.numberOfLines].size;
    } else {
        return [super sizeThatFits:size];
    }
}

@end
