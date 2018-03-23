//
//  NSMutableArray+SafeWrapper.m
//  SafeAryAndDic
//
//  Created by dev on 2018/3/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSMutableArray+SafeWrapper.h"
#import "NSObject+IMPChange.h"
//#import <objc/runtime.h>

@implementation NSMutableArray (SafeWrapper)

+ (void)load{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        
        [self SwizzlingMethod:@"addObject:"
            systemClassString:@"__NSArrayM"
           toSafeMethodString:@"imp_addObject:"
            targetClassString:@"NSMutableArray"];
        
        [self SwizzlingMethod:@"insertObject:atIndex:"
            systemClassString:@"__NSArrayM"
           toSafeMethodString:@"imp_insertObject:atIndex:"
            targetClassString:@"NSMutableArray"];
        
        [self SwizzlingMethod:@"removeLastObject"
            systemClassString:@"__NSArrayM"
           toSafeMethodString:@"imp_removeLastObject"
            targetClassString:@"NSMutableArray"];
        
        [self SwizzlingMethod:@"removeObjectAtIndex:"
            systemClassString:@"__NSArrayM"
           toSafeMethodString:@"imp_removeObjectAtIndex:"
            targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"replaceObjectAtIndex:withObject:"
            systemClassString:@"__NSArrayM"
           toSafeMethodString:@"imp_replaceObjectAtIndex:withObject:"
            targetClassString:@"NSMutableArray"];
        
    });
}

//- (void)addObject:(ObjectType)anObject;
//- (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;
//- (void)removeLastObject;
//- (void)removeObjectAtIndex:(NSUInteger)index;
//- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;

- (void)imp_addObject:(id)object{
    if (object) {
        [self imp_addObject:object];
    }
}

- (void)imp_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (index > self.count) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self imp_insertObject:anObject atIndex:index];
}

- (void)imp_removeLastObject{
    if (self.count > 0) {
        [self imp_removeLastObject];
    }
}

- (void)imp_removeObjectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        [self imp_removeObjectAtIndex:index];
    }
}

- (void)imp_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (index >= self.count) {
        return;
    }

    if (!anObject) {
        return;
    }
    [self imp_replaceObjectAtIndex:index withObject:anObject];
}

@end
