//
//  NSArray+ELNUtils.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 27.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant ObjectType> (ELNUtils)

/// Returns the first object in the array passing the test.
- (ObjectType)eln_objectPassingTest:(BOOL (^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate;

/// Returns object in the array passing the test considering specified options.
- (ObjectType)eln_objectWithOptions:(NSEnumerationOptions)options passingTest:(BOOL (^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate;

/// Returns objects in the array passing the test.
- (NSArray<ObjectType> *)eln_objectsPassingTest:(BOOL (^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate;

/// Returns objects in the array passing the test considering specified options.
- (NSArray<ObjectType> *)eln_objectsWithOptions:(NSEnumerationOptions)options passingTest:(BOOL (^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate;

/// Map objects to returned values, filter out those ones where nil is returned.
- (NSArray *)eln_map:(id (^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate;

/** 
Enumerate objects executing block. Same as enumerateObjectsUsingBlock: but very useful 
to avoid parameter variable shadowing during nested block usage.
*/
- (void)eln_apply:(void (^)(ObjectType obj))block;

@end

NS_ASSUME_NONNULL_END
