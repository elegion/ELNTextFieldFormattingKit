//
//  NSURLRequest+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 13.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSURLRequest+ELNUtils.h"

static NSString *ELNStringByAddingSlashes(NSString *string) {
    string = [string stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    return string;
}

@implementation NSURLRequest (ELNUtils)

- (NSString *)eln_CURL {
    NSMutableArray *args = [NSMutableArray new];
    NSMutableArray *flags = [[NSMutableArray alloc] initWithObjects:@"-sS", nil];
    
    // method
    NSString *method = [NSString stringWithFormat:@"-X \"%@\"", ELNStringByAddingSlashes(self.HTTPMethod ?: @"GET")];
    [args addObject:method];
    
    NSStringEncoding encoding = NSUTF8StringEncoding;
    
    // headers
    for (id key in self.allHTTPHeaderFields) {
        id value = self.allHTTPHeaderFields[key];
        NSString *header = [NSString stringWithFormat:@"-H \"%@: %@\"", ELNStringByAddingSlashes(key), ELNStringByAddingSlashes(value)];
        [args addObject:header];
        
        if ([key isEqualToString:@"Accept-Encoding"]) {
            [flags addObject:@"--compressed"];
        }
        
        if ([key isKindOfClass:[NSString class]] && [(NSString *)key isEqualToString:@"Content-Type"]) {
            NSArray *components = [value componentsSeparatedByString:@";"];
            for (NSString *component in components) {
                NSArray *keyValue = [component componentsSeparatedByString:@"="];
                if (keyValue.count == 2) {
                    NSString *k = [keyValue.firstObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    NSString *v = [keyValue.lastObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    if ([k isEqualToString:@"charset"]) {
                        if ([v isEqualToString:@"windows-1251"]) {
                            encoding = NSWindowsCP1251StringEncoding;
                        }
                    }
                }
            }
        }
    }
    
    // body
    if (self.HTTPBody != nil) {
        NSString *body = [[NSString alloc] initWithData:self.HTTPBody encoding:encoding];
        if (body != nil) {
            NSString *data = [NSString stringWithFormat:@"--data \"%@\"", ELNStringByAddingSlashes(body)];
            [args addObject:data];
        }
    }
    
    return [NSString stringWithFormat:@"curl %@ \"%@\" %@", [args componentsJoinedByString:@" "], self.URL.absoluteString, [flags componentsJoinedByString:@" "]];
}

@end
