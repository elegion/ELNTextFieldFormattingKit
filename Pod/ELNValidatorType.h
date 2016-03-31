//
//  ELNValidatorType.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

@protocol ELNValidatorType <NSObject, NSCopying>

- (BOOL)isValid:(id)value error:(NSError **)error;

@optional
- (BOOL)isValid:(id)value allowsEmpty:(BOOL)allowsEmpty error:(NSError **)error;

@end
