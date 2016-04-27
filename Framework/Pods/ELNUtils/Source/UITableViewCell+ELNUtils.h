//
//  UITableViewCell+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 01.12.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

/// Returns default separator insets for cell.
extern UIEdgeInsets ELNTableViewCellDefaultSeparatorInsets();

@interface UITableViewCell (ELNUtils)

- (void)eln_setSeparatorInset:(UIEdgeInsets)separatorInset;

/// Returns height for autolayout based cell.
- (CGFloat)eln_heightForWidth:(CGFloat)width configuration:(void (^)(UITableViewCell *cell))configuration;

@end
