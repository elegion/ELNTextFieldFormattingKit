//
//  UICollectionView+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 05.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UICollectionView+ELNUtils.h"

@implementation UICollectionView (ELNUtils)

- (void)eln_deselectSelectedRowsAnimated:(BOOL)animated {
    NSArray *indexPaths = self.indexPathsForSelectedItems;
    for (NSIndexPath *indexPath in indexPaths) {
        [self deselectItemAtIndexPath:indexPath animated:animated];
    }
}

@end


@implementation UICollectionView (ELNNibRegistration)

- (void)eln_registerCellForClass:(Class)cellClass
{
    [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)eln_registerCellNIBForClass:(Class)cellClass
{
    NSString *className = NSStringFromClass(cellClass);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    NSAssert(nib, @"No NIB found for specified class.");
    [self registerNib:nib forCellWithReuseIdentifier:className];
}

- (id)eln_dequeueReusableCellForClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath
{
    return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass)
                                           forIndexPath:indexPath];
}

@end
