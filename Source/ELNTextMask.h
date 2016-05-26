//
//  ELNTextMask.h
//  Pods
//
//  Created by Geor Kasapidi on 08.02.16.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ELNTextMask <NSObject, NSCopying>

- (BOOL)shouldChangeText:(NSString *)text withReplacementString:(NSString *)string inRange:(NSRange)range;
- (NSString *)filteredStringFromString:(NSString *)string cursorPosition:(NSUInteger * __nullable)cursorPosition;
- (NSString *)formattedStringFromString:(NSString *)string cursorPosition:(NSUInteger * __nullable)cursorPosition;

@end

NS_ASSUME_NONNULL_END
