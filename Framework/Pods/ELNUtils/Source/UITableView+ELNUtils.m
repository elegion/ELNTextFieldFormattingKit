//
//  UITableView+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 30.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "UITableView+ELNUtils.h"

static NSString * const kRefreshControlSelector = @"RefreshControl";

@implementation UITableView (ELNUtils)

- (void)eln_deselectSelectedRowsAnimated:(BOOL)animated {
    NSArray *indexPaths = self.indexPathsForSelectedRows;
    for (NSIndexPath *indexPath in indexPaths) {
        [self deselectRowAtIndexPath:indexPath animated:animated];
    }
}

- (void)eln_setRefreshControl:(UIRefreshControl *)refreshControl {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    NSString *selector = [NSString stringWithFormat:@"_set%@:", kRefreshControlSelector];
    [self performSelector:NSSelectorFromString(selector) withObject:refreshControl];
#pragma clang diagnostic pop
}

@end


@implementation UITableView (ELNNibRegistration)

- (void)eln_registerCellForClass:(Class)cellClass
{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)eln_registerCellNIBForClass:(Class)cellClass
{
    NSString *className = NSStringFromClass(cellClass);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    NSAssert(nib, @"No NIB found for specified class.");
    [self registerNib:nib forCellReuseIdentifier:className];
}

- (id)eln_dequeueReusableCellForClass:(Class)cellClass
{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

- (id)eln_dequeueReusableCellForClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath
{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)
                                      forIndexPath:indexPath];
}

- (void)eln_registerHeaderFooterViewForClass:(Class)headerFooterViewClass
{
    [self registerClass:headerFooterViewClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(headerFooterViewClass)];
}

- (void)eln_registerHeaderFooterViewNIBForClass:(Class)headerFooterViewClass
{
    NSString *className = NSStringFromClass(headerFooterViewClass);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    NSAssert(nib, @"No NIB found for specified class.");
    [self registerNib:nib forHeaderFooterViewReuseIdentifier:className];
}

- (id)eln_dequeueReusableHeaderFooterViewForClass:(Class)headerFooterViewClass
{
    return [self dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerFooterViewClass)];
}

@end
