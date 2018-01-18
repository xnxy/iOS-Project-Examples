//
//  NSArray+SafeWrapper.m
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import "NSArray+SafeWrapper.h"

@implementation NSArray (SafeWrapper)

-(id)objectAtIndexSafe:(NSUInteger)index {
    
    if (index < self.count) {
        return self[index];
    }
    return nil;
}

@end
