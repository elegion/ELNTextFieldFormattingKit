//
//  NSError+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 05.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

@interface NSError (ELNUtils)

/// Returns localized description by "key error.network.unavailable" for network errors and simple description for others.
@property (nonatomic, readonly) NSString *eln_localizedDescription;

@property (nonatomic, readonly) BOOL eln_isNetworkError;
@property (nonatomic, readonly) BOOL eln_isNetworkOperationCancelledError;

- (BOOL)eln_matchesDomain:(NSString *)domain code:(NSInteger)code;

@end
