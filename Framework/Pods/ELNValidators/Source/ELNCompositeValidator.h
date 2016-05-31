//
//  ELNCompositeValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 26.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNValidatorType.h"

NS_ASSUME_NONNULL_BEGIN

@interface ELNCompositeValidator : NSObject <ELNValidatorType>

- (void)addValidator:(id<ELNValidatorType>)validator;

@end

NS_ASSUME_NONNULL_END
