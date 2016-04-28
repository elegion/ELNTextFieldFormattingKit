//
//  ELNPhoneNumberMask.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

#import "ELNTextMask.h"

@interface ELNPhoneNumberMask : NSObject <ELNTextMask>

/**
 *  Specifies not editable phone number prefix. Phone number prefix will be separated by a whitespace from the actual phone number.
 */
@property (nonatomic, copy, nullable) NSString *prefix;

@end
