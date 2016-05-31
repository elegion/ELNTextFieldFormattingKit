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

#pragma mark - Cell Registration

- (void)eln_registerCellWithClass:(Class)cellClass {
    [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)eln_registerCellNibWithClass:(Class)cellClass {
    NSString *className = NSStringFromClass(cellClass);
    NSBundle *bundle = [NSBundle bundleForClass:cellClass];
    UINib *nib = [UINib nibWithNibName:className bundle:bundle];
    NSAssert(nib, @"No nib found for class %@.", className);
    [self registerNib:nib forCellWithReuseIdentifier:className];
}

- (__kindof UICollectionViewCell *)eln_dequeueReusableCellWithClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
}

@end
