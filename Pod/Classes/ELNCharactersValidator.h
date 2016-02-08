//
//  ELNCharactersValidator.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

#import "ELNValidatorType.h"

@interface ELNCharactersValidator : NSObject <ELNValidatorType>

@property (nonatomic, assign) BOOL allowsEmpty;

@property (nonatomic, strong) NSCharacterSet *allowedCharacterSet;

- (instancetype)initWithAllowedCharacterSet:(NSCharacterSet *)allowedCharacterSet;

@end
