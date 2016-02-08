//
//  ELNViewController.m
//  ELNTextFieldFormattingKit
//
//  Created by Geor Kasapidi on 02/08/2016.
//

#import <ELNTextFieldFormattingKit/ELNCurrencyTextField.h>
#import <ELNTextFieldFormattingKit/ELNPhoneNumberMask.h>
#import <ELNTextFieldFormattingKit/ELNCardNumberMask.h>
#import <ELNTextFieldFormattingKit/ELNTextFieldFormatter.h>

#import "ELNViewController.h"

@interface ELNViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardTextField;
@property (weak, nonatomic) IBOutlet ELNCurrencyTextField *moneyTextField;

@property (strong, nonatomic) ELNTextFieldFormatter *phoneTextFieldFormatter;
@property (strong, nonatomic) ELNTextFieldFormatter *cardTextFieldFormatter;

@end

@implementation ELNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // phone
    
    self.phoneTextField.delegate = self;
    ELNPhoneNumberMask *mask = [ELNPhoneNumberMask new];
    mask.prefix = @"+7";
    self.phoneTextFieldFormatter = [[ELNTextFieldFormatter alloc] initWithTextField:self.phoneTextField mask:mask];
    
    // card
    
    self.cardTextField.delegate = self;
    self.cardTextFieldFormatter = [[ELNTextFieldFormatter alloc] initWithTextField:self.cardTextField mask:[ELNCardNumberMask new]];
    
    // money
    
    // nothing to setup - see ELNCurrencyTextField
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phoneTextField) {
        return [self.phoneTextFieldFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    
    if (textField == self.cardTextField) {
        return [self.cardTextFieldFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    
    return YES;
}

@end
