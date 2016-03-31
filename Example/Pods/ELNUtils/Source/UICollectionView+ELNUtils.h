//
//  UICollectionView+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 05.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

@interface UICollectionView (ELNUtils)

- (void)eln_deselectSelectedRowsAnimated:(BOOL)animated;

@end


@interface UICollectionView (ELNNibRegistration)

/// Register cell class by reuse identifier equal to class name.
- (void)eln_registerCellForClass:(Class)cellClass;
/// Register NIB named same as class by reuse identifier equal to class name.
- (void)eln_registerCellNIBForClass:(Class)cellClass;
/// Dequeue cell by reuse identifier equal to class name.
- (id)eln_dequeueReusableCellForClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath;

@end
