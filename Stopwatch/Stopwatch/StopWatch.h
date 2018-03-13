//
//  StopWatch.h
//  Stopwatch
//
//  Created by dev on 2018/3/13.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^StopWatchBlock)(NSDate *date);

// 说明：此秒表类是基于CADisplayLink所写，每一帧刷新一次
@interface StopWatch : NSObject

@property (nonatomic, copy) StopWatchBlock stopWatchBlock;

- (void)start;        // 开始
- (void)stop;         // 停止
- (void)reset;        // 复位
- (NSDate *)gainDate; // 获取时间（只有在start的时候获取时间才有意义，stop之后返回值为0）

@end
