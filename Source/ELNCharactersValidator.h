//
//  ELNCharactersValidator.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

#import "ELNValidatorType.h"

NS_ASSUME_NONNULL_BEGIN

@interface ELNCharactersValidator : NSObject <ELNValidatorType>

@property (nonatomic, assign) BOOL allowsEmpty;

@property (nonatomic, strong, nullable) NSCharacterSet *allowedCharacterSet;

- (instancetype)initWithAllowedCharacterSet:(NSCharacterSet * _Nullable)allowedCharacterSet;

@end

NS_ASSUME_NONNULL_END
