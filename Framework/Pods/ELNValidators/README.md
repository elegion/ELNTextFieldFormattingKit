#Validators

Коллекция валидаторов

- String Length Validator
- Characters Validator
- Amount Validator
- Email Validator
- Composite Validator

## Installation

###Cocoapods

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/elegion/ios-podspecs'

pod 'ELNValidators' 
```

###Carthage

```
github 'elegion/ios-ELNValidators'
```

## Predefined Validators 

###String Length

Валидатор длины строки

```objective-c
ELNStringLengthValidator *validator = [[ELNStringLengthValidator alloc] initWithMinLength:3 maxLength:6];
BOOL isValid = [validator isValid:@"123" error:nil];
```

###Characters

Валидатор допустимых символов

```objective-c
NSCharacterSet *allowedCharacterSet = [NSCharacterSet decimalDigitsCharacterSet];
ELNCharactersValidator *validator = [[ELNCharactersValidator alloc] initWithAllowedCharacterSet:allowedCharacterSet];
BOOL isValid = [validator isValid:@"123" error:nil];
```

###Amount

Валидатор денежной суммы

```objective-c
ELNAmountValidator *validator = [ELNAmountValidator new];
BOOL isValid = [validator isValid:@"123.23" error:nil];
```

###Email

Валидатор электронной почты

```objective-c
ELNEmailValidator *validator = [ELNEmailValidator new];
BOOL isValid = [validator isValid:@"test@example.com" error:nil];
```

###Composite

Композиция нескольких валидаторов

```objective-c
ELNStringLengthValidator *stringLengthValidator = [[ELNStringLengthValidator alloc] initWithMinLength:0 maxLength:6];
ELNCharactersValidator *charactersValidator = [[ELNCharactersValidator alloc] initWithAllowedCharacterSet:[NSCharacterSet decimalDigitsCharaterSet]];
ELNCompositeValidator *validator = [ELNCompositeValidator new];
[validator addValidator:stringLengthValidator];
[validator addValidator:charactersValidator];
BOOL isValid = [validator isValid:@"12345" error:nil];
```

## Contribution

###Cocoapods

```sh
# download source code, fix bugs, implement new features

pod repo add legion https://github.com/elegion/ios-podspecs
pod repo push legion ELNValidators.podspec
```

