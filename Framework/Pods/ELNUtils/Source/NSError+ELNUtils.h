//
//  NSError+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 05.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

@interface NSError (ELNUtils)

- (BOOL)eln_isNetworkConnectionError;

- (BOOL)eln_isNetworkCancelledError;

- (BOOL)eln_matchesDomain:(NSString *)domain codes:(NSArray<NSNumber *> *)codes;

@end
