//
//  NSMutableArray+SafeWrapper.h
//  DeleteCell
//
//  Created by dev on 2018/1/18.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (SafeWrapper)

- (void)removeObjectAtIndexSafe:(NSUInteger)index;

@end
