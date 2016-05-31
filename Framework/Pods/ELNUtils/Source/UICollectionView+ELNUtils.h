//
//  UICollectionView+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 05.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (ELNUtils)

- (void)eln_deselectSelectedRowsAnimated:(BOOL)animated;

/// Register cell class by reuse identifier equal to class name.
- (void)eln_registerCellWithClass:(Class)cellClass;

/// Register NIB named same as class by reuse identifier equal to class name.
- (void)eln_registerCellNibWithClass:(Class)cellClass;

/// Dequeue cell by reuse identifier equal to class name.
- (__kindof UICollectionViewCell *)eln_dequeueReusableCellWithClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
