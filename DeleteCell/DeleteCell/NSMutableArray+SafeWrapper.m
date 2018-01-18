//
//  NSMutableArray+SafeWrapper.m
//  DeleteCell
//
//  Created by dev on 2018/1/18.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSMutableArray+SafeWrapper.h"

@implementation NSMutableArray (SafeWrapper)

- (void)removeObjectAtIndexSafe:(NSUInteger)index{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

@end
