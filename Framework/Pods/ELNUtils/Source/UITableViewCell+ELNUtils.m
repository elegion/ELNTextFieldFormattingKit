//
//  UITableViewCell+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 01.12.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UITableViewCell+ELNUtils.h"

UIEdgeInsets ELNTableViewCellDefaultSeparatorInsets() {
    if ([UIScreen mainScreen].bounds.size.width >= 414) {
        return UIEdgeInsetsMake(0, 20, 0, 0);
    } else {
        return UIEdgeInsetsMake(0, 15, 0, 0);
    }
}

@implementation UITableViewCell (ELNUtils)

- (void)eln_setSeparatorInset:(UIEdgeInsets)separatorInset {
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        self.preservesSuperviewLayoutMargins = NO;
        self.layoutMargins = UIEdgeInsetsZero;
    }
    self.separatorInset = separatorInset;
}

- (CGFloat)eln_heightForWidth:(CGFloat)width configuration:(void (^)(UITableViewCell *cell))configuration {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
    if (configuration) {
        configuration(self);
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGFloat height = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
    return height;
}

@end
