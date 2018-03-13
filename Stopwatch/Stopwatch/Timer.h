//
//  Timer.h
//  Stopwatch
//
//  Created by dev on 2018/3/13.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimerBlock)(NSUInteger interval);

@interface Timer : NSObject

@property (nonatomic, copy)TimerBlock timerBlock;

- (void)start; //开始
- (void)stop; //停止
- (void)reset; //复位

@end
