//
//  ELNCurrencyMask.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

#import "ELNTextMask.h"
#import "ELNCurrencyFormatter.h"

@interface ELNCurrencyMask : NSObject <ELNTextMask>

@property (nonatomic, copy) ELNCurrencyFormatter *formatter;

@end
