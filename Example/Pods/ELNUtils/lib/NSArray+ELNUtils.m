//
//  NSArray+ELNUtils.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 27.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "NSArray+ELNUtils.h"

@implementation NSArray (ELNUtils)

- (id)eln_objectPassingTest:(BOOL (^)(id, NSUInteger, BOOL *))predicate {
    NSUInteger index = [self indexOfObjectPassingTest:predicate];
    if (index == NSNotFound) {
        return nil;
    } else {
        return self[index];
    }
}

- (id)eln_objectWithOptions:(NSEnumerationOptions)options passingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    NSUInteger index = [self indexOfObjectWithOptions:options passingTest:predicate];
    if (index == NSNotFound) {
        return nil;
    } else {
        return self[index];
    }
}

- (NSArray *)eln_objectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:predicate]];
}

- (NSArray *)eln_objectsWithOptions:(NSEnumerationOptions)options passingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    return [self objectsAtIndexes:[self indexesOfObjectsWithOptions:options passingTest:predicate]];
}

- (NSArray *)eln_map:(id (^)(id obj, NSUInteger index, BOOL *stop))predicate {
    if (predicate == nil) {
        return nil;
    }

    NSMutableArray *result = [NSMutableArray new];
    for (NSUInteger i = 0; i < self.count; i++) {
        BOOL stop = NO;
        id obj = predicate(self[i], i, &stop);
        if (obj != nil) {
            [result addObject:obj];
        }
        
        if (stop) {
            return [result copy];
        }
    }
    return [result copy];
}

- (BOOL)eln_any:(BOOL (^)(id, NSUInteger, BOOL *))predicate {
    return [self eln_objectPassingTest:predicate] != nil;
}

- (void)eln_apply:(void (^)(id))block {
    if (block) {
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            block(obj);
        }];
    }
}

@end
