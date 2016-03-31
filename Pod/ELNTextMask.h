//
//  ELNTextMask.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

@protocol ELNTextMask <NSObject, NSCopying>

- (BOOL)shouldChangeText:(NSString *)text withReplacementString:(NSString *)string inRange:(NSRange)range;
- (NSString *)filteredStringFromString:(NSString *)string cursorPosition:(NSUInteger *)cursorPosition;
- (NSString *)formattedStringFromString:(NSString *)string cursorPosition:(NSUInteger *)cursorPosition;

@end
