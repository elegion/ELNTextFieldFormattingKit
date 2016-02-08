//
//  UILabel+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 16.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UILabel+ELNUtils.h"

@implementation UILabel (ELNUtils)

- (CGSize)eln_sizeThatFits:(CGSize)size {
    if (self.text != nil) {
        NSMutableDictionary *attributes = [NSMutableDictionary new];
        
        // font
        if (self.font) {
            attributes[NSFontAttributeName] = self.font;
        }
        
        // linebreak mode
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = self.lineBreakMode;
        attributes[NSParagraphStyleAttributeName] = paragraphStyle;
        
        // options
        NSStringDrawingOptions options = self.numberOfLines != 1 ? NSStringDrawingUsesLineFragmentOrigin : NSStringDrawingTruncatesLastVisibleLine;
        
        CGRect rect = [self.text boundingRectWithSize:size options:options attributes:attributes context:nil];
        rect.size.width =  ceil(rect.size.width);
        rect.size.height =  ceil(rect.size.height);

        return rect.size;
    } else {
        return [super sizeThatFits:size];
    }
}

@end
