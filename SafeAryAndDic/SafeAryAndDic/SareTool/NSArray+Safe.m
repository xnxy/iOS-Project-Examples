//
//  NSArray+Safe.m
//  SafeAryAndDic
//
//  Created by dev on 2018/3/16.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSArray+Safe.h"
#import "NSObject+IMPChange.h"
#import <objc/runtime.h>

@implementation NSArray (Safe)

+ (void)load{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        [self SwizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSArrayI" toSafeMethodString:@"imp_objectAtIndex:" targetClassString:@"NSArray"];
        
        [self SwizzlingMethod:@"arrayByAddingObject:" systemClassString:@"__NSArrayI" toSafeMethodString:@"imp_arrayByAddingObject:" targetClassString:@"NSArray"];
        
        [self SwizzlingMethod:@"initWithObjects:count:" systemClassString:@"__NSPlaceholderArray" toSafeMethodString:@"imp_initWithObjects:count:" targetClassString:@"NSArray"];
        
        
    });
}

- (id)imp_objectAtIndex:(NSUInteger)index{
    
    if (index >= [self count]) {
        return nil;
    }
    return [self imp_objectAtIndex:index];
    
}

- (NSArray *)imp_arrayByAddingObject:(id)anObject {
    if (!anObject) {
        return self;
    }
    return [self imp_arrayByAddingObject:anObject];
}

- (instancetype)imp_initWithObjects:(id *)objects count:(NSUInteger)count {
    NSUInteger newCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objects[i]) {
            break;
        }
        newCount++;
    }

    return [self imp_initWithObjects:objects count:newCount];
}

@end
