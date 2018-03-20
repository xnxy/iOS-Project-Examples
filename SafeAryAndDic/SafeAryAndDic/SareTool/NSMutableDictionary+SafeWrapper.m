//
//  NSMutableDictionary+SafeWrapper.m
//  SafeAryAndDic
//
//  Created by dev on 2018/3/20.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSMutableDictionary+SafeWrapper.h"
#import "NSObject+IMPChange.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (SafeWrapper)

+ (void)load{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        
        [self SwizzlingMethod:@"imp_removeObjectForKey:"
            systemClassString:@"NSMutableDictionary"
           toSafeMethodString:@"removeObjectForKey:"
            targetClassString:@"__NSDictionaryM"];
        
        [self SwizzlingMethod:@"imp_setObject:forKey:"
            systemClassString:@"NSMutableDictionary"
           toSafeMethodString:@"setObject:forKey:"
            targetClassString:@"__NSDictionaryM"];
        
    });
}

//- (void)removeObjectForKey:(KeyType)aKey;
//- (void)setObject:(ObjectType)anObject forKey:(KeyType <NSCopying>)aKey;

- (void)imp_removeObjectForKey:(id)key{
    if (key) {
        [self imp_removeObjectForKey:key];
    }
}

- (void)imp_setObject:(id)anObject forKey:(id)akey{
    if (anObject && akey) {
        [self imp_setObject:anObject forKey:akey];
    }
}

@end
