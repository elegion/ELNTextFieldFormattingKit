//
//  UITableViewCell+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 01.12.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UITableViewCell+ELNUtils.h"

@implementation UITableViewCell (ELNUtils)

- (void)eln_setSeparatorInset:(UIEdgeInsets)separatorInset {
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        self.preservesSuperviewLayoutMargins = NO;
        self.layoutMargins = UIEdgeInsetsZero;
    }
    self.separatorInset = separatorInset;
}

@end
