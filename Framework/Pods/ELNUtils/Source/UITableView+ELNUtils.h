//
//  UITableView+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 30.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

@interface UITableView (ELNUtils)

- (void)eln_deselectSelectedRowsAnimated:(BOOL)animated;

/**
 Safely adds refresh control to the table view.
 
 If you are not using UITableViewController and use to add UIRefreshControl directly to the UITableView 
 by calling `addSubview:`, than you probably should know about a bug when the table view is "jumping" 
 when the refresh control is changing table view's content inset. There are two ways to avoid the bug. 
 First is to override `setContentInset:`, for details see the link below. 
 Second is to setup refresh control using table view's private property.
 
 @see http://stackoverflow.com/questions/19483511/uirefreshcontrol-with-uicollectionview-in-ios7
 */
- (void)eln_setRefreshControl:(UIRefreshControl *)refreshControl;

@end


@interface UITableView (ELNNibRegistration)

/// Register cell class by reuse identifier equal to class name.
- (void)eln_registerCellForClass:(Class)cellClass;
/// Register NIB named same as class by reuse identifier equal to class name.
- (void)eln_registerCellNIBForClass:(Class)cellClass;
/// Dequeue cell by reuse identifier equal to class name.
- (id)eln_dequeueReusableCellForClass:(Class)cellClass;
/// Dequeue cell by reuse identifier equal to class name.
- (id)eln_dequeueReusableCellForClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath;

/// Register header/footer class by reuse identifier equal to class name.
- (void)eln_registerHeaderFooterViewForClass:(Class)headerFooterViewClass;
/// Register header/footer NIB named same as class by reuse identifier equal to class name.
- (void)eln_registerHeaderFooterViewNIBForClass:(Class)headerFooterViewClass;
/// Dequeue header/footer by reuse identifier equal to class name.
- (id)eln_dequeueReusableHeaderFooterViewForClass:(Class)headerFooterViewClass;

@end
