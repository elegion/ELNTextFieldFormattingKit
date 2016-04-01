//
//  ELNCurrencyFormatter.m
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <ELNUtils/NSString+ELNUtils.h>
#import <ELNUtils/NSNumber+ELNUtils.h>

#import "ELNCurrencyFormatter.h"

// see https://www.cs.tut.fi/~jkorpela/chars/spaces.html
// static NSString * const kGroupingSeparator = @"\u202F"; // narrow nbsp
// static NSString * const kGroupingSeparator = @"\u2009"; // thin space

@interface ELNCurrencyFormatter ()

@property (nonatomic, copy) NSNumberFormatter *numberFormatter;

@end

@implementation ELNCurrencyFormatter

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.numberFormatter = [NSNumberFormatter new];
        self.numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        self.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        self.currencyCode = self.numberFormatter.currencyCode;
    }
    return self;
}

#pragma mark - Managing Input and Output Attributes

- (NSUInteger)maximumIntegerDigits {
    return self.numberFormatter.maximumIntegerDigits;
}

- (void)setMaximumIntegerDigits:(NSUInteger)maximumIntegerDigits {
    self.numberFormatter.maximumIntegerDigits = maximumIntegerDigits;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) copy = [self.class new];
    copy.numberFormatter = self.numberFormatter;
    copy.locale = self.locale;
    copy.currencyCode = self.currencyCode;
    return copy;
}

#pragma mark - Accessors

- (void)setCurrencyCode:(NSString *)currencyCode {
    _currencyCode = currencyCode;
    self.numberFormatter.currencyCode = currencyCode;
}

- (NSString *)decimalSeparator {
    return self.numberFormatter.currencyDecimalSeparator;
}

- (void)setDecimalSeparator:(NSString *)decimalSeparator {
    self.numberFormatter.currencyDecimalSeparator = decimalSeparator;
}

- (NSLocale *)locale {
    return self.numberFormatter.locale;
}

- (void)setLocale:(NSLocale *)locale {
    self.numberFormatter.locale = locale;
}

#pragma mark - Textual representation of cell content

- (NSString *)stringFromNumber:(NSNumber *)number {
    return [self stringForObjectValue:number];
}

- (NSString *)stringForObjectValue:(id)obj {
    if (![obj isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    NSNumber *number = obj;
    
    NSString *suffix;
    NSUInteger numberOfIntergerDigits = [number eln_numberOfIntegerDigits];
    if (numberOfIntergerDigits > self.numberFormatter.maximumIntegerDigits) {
        if (numberOfIntergerDigits > 6) {
            number = @(number.integerValue / 1000000.);
            suffix = @"млн.";
        } else if (numberOfIntergerDigits >= 5) {
            number = @(number.integerValue / 1000.);
            suffix = @"тыс.";
        }
    }
    
    NSLocale *locale = self.locale ?: [NSLocale autoupdatingCurrentLocale];
    NSString *currencySymbol = [locale objectForKey:NSLocaleCurrencySymbol];
    
    double value = number.doubleValue;
    if (ABS(round(value) - value) <= DBL_EPSILON) {
        self.numberFormatter.maximumFractionDigits = 0;
    } else {
        self.numberFormatter.maximumFractionDigits = 2;
    }
    
    if (self.shouldReduceFractionDigits) {
        self.numberFormatter.minimumFractionDigits = 0;
    } else {
        self.numberFormatter.minimumFractionDigits = MIN(self.numberFormatter.maximumFractionDigits, 2u);
    }
    
    // reset currency code to fix invalid number formatter's internal state and force max/min fraction digits setting to be set correctly
    self.numberFormatter.currencyCode = self.currencyCode;
    
    NSString *result = [[self.numberFormatter copy] stringForObjectValue:number];
    NSString *resultWithNoCurrencySymbol = [[result stringByReplacingOccurrencesOfString:currencySymbol withString:@""] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (self.currencyCode == nil) {
        result = resultWithNoCurrencySymbol;
    }
    if (suffix != nil) {
        result = [resultWithNoCurrencySymbol stringByAppendingString:[NSString stringWithFormat:@"%@%@", self.numberFormatter.currencyGroupingSeparator, suffix]];
    }
    return result;
}

#pragma mark - Object equivalent to textual representation

- (NSNumber *)numberFromString:(NSString *)string {
    NSNumber *obj;
    [self getObjectValue:&obj forString:string errorDescription:nil];
    return obj;
}

- (BOOL)getObjectValue:(out id  _Nullable __autoreleasing *)obj forString:(NSString *)string errorDescription:(out NSString *__autoreleasing  _Nullable *)error {
    BOOL result = [self.numberFormatter getObjectValue:obj forString:string errorDescription:error];
    if (!result && obj != NULL) {
        NSNumber *number = [string eln_numberValue];
        if (number != nil) {
            *obj = number;
            return YES;
        }
        return NO;
    }
    return result;
}

@end
