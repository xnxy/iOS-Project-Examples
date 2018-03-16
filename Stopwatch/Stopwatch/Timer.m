//
//  Timer.m
//  Stopwatch
//
//  Created by dev on 2018/3/13.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timer.h"
#import "YYWeakProxy.h"

@interface Timer()

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, assign) NSUInteger startInteger;

@end

@implementation Timer

#pragma mark ---
#pragma mark --- 开始 ---
- (void)start{
    
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    
    if (self.displayLink == nil) {
        if (self.startInteger > 0) {
            self.startInteger = 0;
        }
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                       selector:@selector(timerRunEvent)];
        self.displayLink.frameInterval = 60;
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    
}

#pragma mark ---
#pragma mark --- 停止 ---
- (void)stop{
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}

#pragma mark ---
#pragma mark --- 复位 ---
- (void)reset{
    self.startInteger = 0;
}

- (void)timerRunEvent{
    self.startInteger ++;
    NSLog(@"---- %lu ---- ",self.startInteger);
    if (self.timerBlock) {
        self.timerBlock(self.startInteger);
    }
}

@end
