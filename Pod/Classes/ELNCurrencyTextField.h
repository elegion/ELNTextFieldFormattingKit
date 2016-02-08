//
//  ELNCurrencyTextField.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <UIKit/UIKit.h>

#import "ELNCurrencyMask.h"

/**
 *  Text Field accuires self delegate to properly position cursor. So you should use ValueChaned event to obtain value changes.
 */
@interface ELNCurrencyTextField : UITextField <UITextFieldDelegate>

@property (nonatomic, strong, readonly) ELNCurrencyMask *currencyMask;
@property (nonatomic, copy) NSNumber *value;
@property (nonatomic, copy) NSString *currencyCode;
@property (nonatomic, copy) BOOL(^shouldBeginEditing)(UITextField *textField);
@property (nonatomic, copy) BOOL(^shouldUpdateTextToValue)(UITextField *textField, NSString *text);

@end
