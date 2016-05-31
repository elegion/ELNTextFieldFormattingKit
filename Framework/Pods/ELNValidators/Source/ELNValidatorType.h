//
//  ELNValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 16.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ELNValidatorType <NSObject, NSCopying>

- (BOOL)isValid:(id)value error:(NSError **)error;

@end
