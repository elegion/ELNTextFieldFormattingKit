# ELNTextFieldFormattingKit

## Usage

#### Phone

```objectivec

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (strong, nonatomic) ELNTextFieldFormatter *phoneTextFieldFormatter;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.phoneTextField.delegate = self;
    ELNPhoneNumberMask *mask = [ELNPhoneNumberMask new];
    mask.prefix = @"+7";
    self.phoneTextFieldFormatter = [[ELNTextFieldFormatter alloc] initWithTextField:self.phoneTextField mask:mask];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phoneTextField) {
        return [self.phoneTextFieldFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }

    return YES;
}

@end

```

#### Card

```objectivec

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cardTextField;

@property (strong, nonatomic) ELNTextFieldFormatter *cardTextFieldFormatter;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cardTextField.delegate = self;
    self.cardTextFieldFormatter = [[ELNTextFieldFormatter alloc] initWithTextField:self.cardTextField mask:[ELNCardNumberMask new]];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.cardTextField) {
        return [self.cardTextFieldFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }

    return YES;
}

@end

```

#### Currency

```objectivec

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ELNCurrencyTextField *moneyTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.moneyTextField.currencyCode = @"USD";
}

@end

```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

ELNTextFieldFormattingKit is available under the MIT license. See the LICENSE file for more info.

## Author

e-Legion
