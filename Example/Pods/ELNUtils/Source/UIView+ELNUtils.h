//
//  UIView+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 13.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ELNUtils)

- (void)eln_wobble;

- (nullable __kindof UIView *)eln_superviewWithClass:(Class)superviewClass;

+ (instancetype)eln_viewFromNibInBundle:(NSBundle * _Nullable)bundle owner:(id _Nullable)owner options:(NSDictionary * _Nullable)options;

+ (instancetype)eln_viewFromNibInBundle:(NSBundle * _Nullable)bundle;

@end

NS_ASSUME_NONNULL_END
