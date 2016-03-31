//
//  ELNCurrencyMask.m
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <ELNUtils/NSString+ELNUtils.h>

#import "ELNCurrencyMask.h"
#import "ELNAmountValidator.h"

static NSUInteger const kMaximumIntegerDigits = 42;

@interface ELNCurrencyMask ()

@property (nonatomic, copy) ELNAmountValidator *validator;

@end

@implementation ELNCurrencyMask

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.validator = [ELNAmountValidator new];
        self.formatter = [ELNCurrencyFormatter new];
        self.formatter.shouldReduceFractionDigits = YES;
    }
    return self;
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    typeof(self) copy = [[self.class alloc] init];
    copy.validator = self.validator;
    copy.formatter = self.formatter;
    return copy;
}

#pragma mark - Formatting

- (NSString *)formattedStringFromString:(NSString *)string {
    NSArray<NSString *> *components = [string componentsSeparatedByCharactersInSet:self.validator.punctuationCharacterSet];
    
    NSString *integerComponent = components.firstObject;
    NSString *doubleComponent = components.count == 2 ? components.lastObject : nil;
    
    // integer value
    if (doubleComponent == nil) {
        NSNumber *number = @(integerComponent.doubleValue);
        return [self.formatter stringForObjectValue:number];
    }
    
    // double value
    NSNumber *number = @(integerComponent.doubleValue);
    ELNCurrencyFormatter *formatter = [self.formatter copy];
    formatter.currencyCode = nil;
    formatter.maximumIntegerDigits = kMaximumIntegerDigits;
    NSString *value = [formatter stringForObjectValue:number];
    
    // suffix
    NSString *suffix = [[self.formatter stringFromNumber:@1] stringByReplacingOccurrencesOfString:@"1" withString:@"" options:(NSStringCompareOptions)0 range:NSMakeRange(0, 1)];
    
    // result
    NSString *result = [@[value, doubleComponent] componentsJoinedByString:self.formatter.decimalSeparator];
    result = [result stringByAppendingString:suffix];
    return result;
}

- (NSString *)unformattedStringFromString:(NSString *)string {
    // remove not allowed characters
    NSCharacterSet *invalidCharacterSet = self.validator.allowedCharacterSet.invertedSet;
    NSString *result = [[string componentsSeparatedByCharactersInSet:invalidCharacterSet] componentsJoinedByString:@""];
    
    // trim leading zeros
    NSRange range = [string rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0"].invertedSet];
    if (range.location != NSNotFound && range.location > 0) {
        result = [result substringFromIndex:range.location];
    }
    
    // trim to maximum fraction digits
    //    result range
    //    [result componentsSeparatedByCharactersInSet:self.validator.punctuationCharacterSet];
    
    return result;
}

#pragma mark - Masking

- (NSString *)prefixForFormattedString:(NSString *)formattedString {
    if ([formattedString rangeOfCharacterFromSet:self.validator.allowedCharacterSet].location == NSNotFound) {
        return nil;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:formattedString];
    NSString *prefix;
    [scanner scanUpToCharactersFromSet:self.validator.allowedCharacterSet intoString:&prefix];
    return prefix;
}

- (BOOL)shouldChangeText:(NSString *)text withReplacementString:(NSString *)string inRange:(NSRange)range {
    NSString *replacedText = [text stringByReplacingCharactersInRange:range withString:string];
    
    NSString *prefix = [self prefixForFormattedString:text];
    NSUInteger prefixLength = prefix.length;
    BOOL isRangeAffectsPrefix = range.location + range.length <= prefixLength && range.location < prefixLength;
    if (isRangeAffectsPrefix) {
        // can't modify prefix
        return NO;
        
    } else {
        if (![self.validator isValid:string allowsEmpty:YES error:nil]) {
            return NO;
        }
        
        NSString *filteredString = [self filteredStringFromString:replacedText cursorPosition:NULL];
        if (![self.validator isValid:filteredString allowsEmpty:YES error:nil]) {
            return NO;
        }
        
        return YES;
    }
}

- (NSString *)filteredStringFromString:(NSString *)string cursorPosition:(NSUInteger *)cursorPosition {
    if (cursorPosition == NULL) {
        return [self unformattedStringFromString:string];
    }
    
    NSString *prefix = [self prefixForFormattedString:string];
    
    // obtain initial cursor position and append prefix if needed
    NSUInteger originalCursorPosition = cursorPosition == NULL ? 0 : *cursorPosition;
    NSUInteger filteredCursorPosition = cursorPosition == NULL ? 0 : *cursorPosition;
    if (prefix.length > 0 && ![string hasPrefix:prefix]) {
        string = [prefix stringByAppendingString:string];
        originalCursorPosition += prefix.length;
        filteredCursorPosition += prefix.length;
    }
    
    NSMutableString *filteredString = [NSMutableString new];
    NSMutableString *haystack = [self unformattedStringFromString:string].mutableCopy;
    NSScanner *scanner = [NSScanner scannerWithString:string ?: @""];
    scanner.charactersToBeSkipped = nil;
    while (!scanner.atEnd && haystack.length > 0) {
        unichar needleCharacter = [haystack characterAtIndex:0];
        NSString *needle = [[NSString alloc] initWithCharacters:&needleCharacter length:1];
        [haystack deleteCharactersInRange:NSMakeRange(0, 1)];
        
        NSString *result;
        [scanner scanUpToString:needle intoString:&result];
        
        if (result.length > 0 && (scanner.scanLocation - result.length) < originalCursorPosition) {
            filteredCursorPosition = (NSUInteger)MAX((NSInteger)filteredCursorPosition - (NSInteger)result.length, 0);
        }
        
        scanner.scanLocation++;
        
        [filteredString appendString:needle];
    }
    
    if (cursorPosition != NULL)
        *cursorPosition = filteredCursorPosition;
    
    return [filteredString copy];
}

- (NSString *)formattedStringFromString:(NSString *)string cursorPosition:(NSUInteger *)cursorPosition {
    if (cursorPosition == NULL) {
        return [self formattedStringFromString:string];
    }
    
    NSString *unformattedString = [self filteredStringFromString:string cursorPosition:cursorPosition];
    
    /// normalize decimal separators
    unformattedString = [[unformattedString componentsSeparatedByCharactersInSet:self.validator.punctuationCharacterSet] componentsJoinedByString:self.formatter.decimalSeparator];
    
    BOOL isZeroString = [unformattedString stringByReplacingOccurrencesOfString:@"0" withString:@""].length == 0;
    
    NSString *formattedString = [self formattedStringFromString:unformattedString];
    if (unformattedString.length == 0 || isZeroString) {
        if (cursorPosition != NULL) {
            *cursorPosition = 1u;
        }
        return formattedString;
    }
    
    NSString *prefix = [self prefixForFormattedString:formattedString];
    
    // obtain initial cursor position and append prefix if needed
    //    NSUInteger originalCursorPosition = 0;
    NSUInteger formattedCursorPosition = 0;
    if (prefix.length > 0) {
        if (![string hasPrefix:prefix]) {
            //            string = [prefix stringByAppendingString:string];
            //            originalCursorPosition += prefix.length;
            formattedCursorPosition += prefix.length;
        }
    }
    
    NSUInteger haystackCursorPosition = cursorPosition == NULL ? 0 : *cursorPosition;
    NSMutableString *haystack = unformattedString.mutableCopy;
    NSScanner *scanner = [NSScanner scannerWithString:formattedString];
    scanner.charactersToBeSkipped = nil;
    while (!scanner.isAtEnd && haystack.length > 0) {
        unichar needleCharacter = [haystack characterAtIndex:0];
        NSString *needle = [[NSString alloc] initWithCharacters:&needleCharacter length:1];
        [haystack deleteCharactersInRange:NSMakeRange(0, 1)];
        
        NSString *result;
        [scanner scanUpToString:needle intoString:&result];
        scanner.scanLocation++;
        
        if (haystackCursorPosition > 0) {
            formattedCursorPosition++;
            haystackCursorPosition--;
            
            // cursor will be positioned before a whitespace character
            formattedCursorPosition += result.length;
        }
    }
    
    if (cursorPosition != NULL)
        *cursorPosition = formattedCursorPosition;
    
    return formattedString;
}

@end
