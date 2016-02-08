//
//  ELNTextFieldFormatter.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

#import "ELNTextMask.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  UITextField formatter that applies a mask to the input text. @see http://stackoverflow.com/a/19161529/318790
 */
@interface ELNTextFieldFormatter : NSFormatter

@property (nonatomic, strong, readonly) id<ELNTextMask> mask;

/**
 *  Initializes the formatter for UITextField with specified mask. Retain's stong reference to passed UITextField and adds target/action for EditingChanged event.
 */
- (instancetype)initWithTextField:(nullable UITextField *)textField mask:(nullable id<ELNTextMask>)mask NS_DESIGNATED_INITIALIZER;
/**
 *  Proxy method to be called from the UITextField's delegate callback.
 *
 *  @param textField Must be the same text field which was passed as initializer argument.
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (NSString *)maskedStringFromString:(NSString *)string;
- (NSString *)unmaskedStringFromString:(NSString *)string;
/**
 *  Set text to text field by preserving cursor position when formatting text by the mask.
 */
- (void)setText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
