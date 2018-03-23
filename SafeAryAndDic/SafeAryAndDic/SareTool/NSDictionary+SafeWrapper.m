//
//  NSDictionary+SafeWrapper.m
//  SafeAryAndDic
//
//  Created by dev on 2018/3/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSDictionary+SafeWrapper.h"
#import "NSObject+IMPChange.h"
//#import <objc/runtime.h>

@implementation NSDictionary (SafeWrapper)

+ (void)load{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        
        [self SwizzlingMethod:@"initWithObjects:forKeys:count:"
            systemClassString:@"__NSPlaceholderDictionary"
           toSafeMethodString:@"initWithObjects_imp:forKeys:count:"
            targetClassString:@"NSDictionary"];
        
    });
}

//- (instancetype)initWithObjects:(const ObjectType _Nonnull [_Nullable])objects forKeys:(const KeyType <NSCopying> _Nonnull [_Nullable])keys count:(NSUInteger)cnt;

- (instancetype)initWithObjects_imp:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)cnt{
    NSUInteger rightCount = 0;
//    __autoreleasing id *
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (!(keys[i] && objects[i])) {
            break;
        }else{
            rightCount ++;
        }
    }

    return [self initWithObjects_imp:objects forKeys:keys count:rightCount];
}

@end
