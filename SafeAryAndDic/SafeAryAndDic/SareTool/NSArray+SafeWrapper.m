//
//  NSArray+SafeWrapper.m
//  SafeAryAndDic
//
//  Created by dev on 2018/3/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSArray+SafeWrapper.h"
#import "NSObject+IMPChange.h"
//#import <objc/runtime.h>

@implementation NSArray (SafeWrapper)

+ (void)load{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{

        [self SwizzlingMethod:@"objectAtIndex:"
            systemClassString:@"__NSArrayI"
           toSafeMethodString:@"imp_objectAtIndex:"
            targetClassString:@"NSArray"];
        
        [self SwizzlingMethod:@"arrayByAddingObject:"
            systemClassString:@"__NSArrayI"
           toSafeMethodString:@"imp_arrayByAddingObject:"
            targetClassString:@"NSArray"];
    });
    
}

//-(id)objectAtIndexSafe:(NSUInteger)index {
//
//    if (index < self.count) {
//        return self[index];
//    }
//    return nil;
//}

- (id)imp_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self imp_objectAtIndex:index];
    }
    return nil;
}

- (NSArray *)imp_arrayByAddingObject:(id)anObject {
    if (anObject) {
        return [self imp_arrayByAddingObject:anObject];
    }
    return self;
}

@end
