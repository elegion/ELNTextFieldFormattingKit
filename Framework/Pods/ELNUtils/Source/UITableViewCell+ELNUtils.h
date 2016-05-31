//
//  UITableViewCell+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 01.12.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

/// Returns default separator insets for cell.
extern UIEdgeInsets ELNTableViewCellDefaultSeparatorInsets();

@interface UITableViewCell (ELNUtils)

- (void)eln_setSeparatorInset:(UIEdgeInsets)separatorInset;

/// Returns height for autolayout based cell.
- (CGFloat)eln_heightForWidth:(CGFloat)width configuration:(void (^ _Nullable)(UITableViewCell *cell))configuration;

@end

NS_ASSUME_NONNULL_END
