//
//  ELNCharactersValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 25.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNValidatorType.h"

NS_ASSUME_NONNULL_BEGIN

@interface ELNCharactersValidator : NSObject <ELNValidatorType>

@property (nonatomic, copy, nullable) NSCharacterSet *allowedCharacterSet;

- (instancetype)initWithAllowedCharacterSet:(NSCharacterSet *)allowedCharacterSet;

@end

NS_ASSUME_NONNULL_END
