//
//  NSArray+SafeWrapper.h
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SafeWrapper)

-(id)objectAtIndexSafe:(NSUInteger)index;

@end
