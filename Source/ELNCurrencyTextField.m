//
//  ELNCurrencyTextField.m
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <ELNUtils/UIView+ELNUtils.h>

#import "ELNCurrencyTextField.h"
#import "ELNTextFieldFormatter.h"
#import "ELNCurrencyMask.h"

@interface ELNCurrencyTextField ()

@property (nonatomic, strong) ELNCurrencyMask *currencyMask;
@property (nonatomic, strong) ELNTextFieldFormatter *formatter;

@end

@implementation ELNCurrencyTextField

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.delegate = self;
    self.keyboardType = UIKeyboardTypeDecimalPad;
    
    self.currencyMask = [ELNCurrencyMask new];
    self.formatter = [[ELNTextFieldFormatter alloc] initWithTextField:self mask:self.currencyMask];
    [self addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Value Accessors

- (void)setValue:(NSNumber *)value {
    value = value == nil ? @0 : value;
    
    // normalize value
    NSString *string = [self.currencyMask.formatter stringFromNumber:value];
    value = [self.currencyMask.formatter numberFromString:string];
    
    if (_value == value) {
        return;
    }
    _value = [value copy];
    
    [self.formatter setText:string];
}

- (void)updateValueWithText:(NSString *)text {
    NSNumber *value = [self.currencyMask.formatter numberFromString:text];
    _value = [value copy];
}

#pragma mark - Currency Configuration

- (NSString *)currencyCode {
    return self.currencyMask.formatter.currencyCode;
}

- (void)setCurrencyCode:(NSString *)currencyCode {
    if (currencyCode != nil && [self.currencyMask.formatter.currencyCode isEqualToString:currencyCode]) {
        return;
    }
    
    self.currencyMask.formatter.currencyCode = currencyCode;
    [self.formatter setText:self.value.stringValue];
}

#pragma mark - Text Field

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.shouldBeginEditing) {
        return self.shouldBeginEditing(textField);
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL result;
    result = [self.formatter.mask shouldChangeText:textField.text withReplacementString:string inRange:range];
    if (!result) {
        [textField eln_wobble];
    }
    
    if (self.shouldUpdateTextToValue) {
        NSString *input = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSString *filteredInput = [self.currencyMask filteredStringFromString:input cursorPosition:NULL];
        result = self.shouldUpdateTextToValue(textField, filteredInput);
        if (!result) {
            [textField eln_wobble];
            return result;
        }
    }
    return result;
}

- (void)textFieldEditingChanged:(UITextField *)textField {
    NSString *text = [self.currencyMask filteredStringFromString:textField.text cursorPosition:NULL];
    [self updateValueWithText:text];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSNumber *value = [self.currencyMask.formatter numberFromString:textField.text];
    
    NSUInteger cursorPosition = value.stringValue.length;
    [self.currencyMask formattedStringFromString:value.stringValue cursorPosition:&cursorPosition];
    
    UITextPosition *targetPosition = [textField positionFromPosition:textField.beginningOfDocument offset:(NSInteger)cursorPosition];
    UITextRange *textRange = [textField textRangeFromPosition:targetPosition toPosition:targetPosition];
    textField.selectedTextRange = textRange;
}

@end
