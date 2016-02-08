//
//  NSSortDescriptor+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 19.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSSortDescriptor+ELNUtils.h"

@implementation NSSortDescriptor (ELNUtils)

+ (NSArray *)eln_sortDescriptorsFromString:(NSString *)string {
    if (string.length == 0) {
        return nil;
    }
    
    NSArray *components = [string componentsSeparatedByString:@","];
    
    NSMutableArray *sortDesctiptors = [[NSMutableArray alloc] initWithCapacity:components.count];
    [components enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BOOL ascending = YES;
        
        if ([[obj substringToIndex:1] isEqualToString:@"+"])
            obj = [obj substringFromIndex:1];
        
        if ([[obj substringToIndex:1] isEqualToString:@"-"]) {
            ascending = NO;
            obj = [obj substringFromIndex:1];
        }
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:obj ascending:ascending];
        [sortDesctiptors addObject:sortDescriptor];
    }];
    
    return sortDesctiptors;
}

@end
