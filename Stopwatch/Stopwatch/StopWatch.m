//
//  StopWatch.m
//  Stopwatch
//
//  Created by dev on 2018/3/13.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopWatch.h"
#import "YYWeakProxy.h"

@interface StopWatch ()

@property (nonatomic, strong) CADisplayLink *countDownTimer;

@property (nonatomic, strong) NSDate        *startDate;
@property (nonatomic, strong) NSDate        *pausedDate;

@property (nonatomic, assign) BOOL           startFlag;

@end

@implementation StopWatch

- (void)start {
    _startFlag = YES;
    if (_countDownTimer) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
    }
    
    if (_countDownTimer == nil) {
        if(_startDate == nil) {
            _startDate = [NSDate date];
        }
        
        if(_pausedDate != nil){
            NSTimeInterval countedTime = [_pausedDate timeIntervalSinceDate:_startDate];
            _startDate = [[NSDate date] dateByAddingTimeInterval:-countedTime];
            _pausedDate = nil;
        }
        
        _countDownTimer               = [CADisplayLink displayLinkWithTarget:self
                                                                    selector:@selector(timerRunEvent)];
        _countDownTimer.frameInterval = 1;
        [_countDownTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)stop {
    _startFlag = NO;
    if (_countDownTimer) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
        _pausedDate     = [NSDate date];
    }
}

- (void)reset {
    _pausedDate = nil;
    _startDate  = [NSDate date];

    if (self.stopWatchBlock) {
        NSTimeInterval currentToSpecifyDuration = [[[NSDate alloc] init] timeIntervalSinceDate:_startDate];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentToSpecifyDuration];
        self.stopWatchBlock(date);
    }
}

- (NSDate *)gainDate {
    if (_startFlag) {
        NSTimeInterval currentToSpecifyDuration = [[[NSDate alloc] init] timeIntervalSinceDate:_startDate];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentToSpecifyDuration];
        return date;
    } else {
        return nil;
    }
}

- (void)timerRunEvent {
    if (self.stopWatchBlock) {
        NSTimeInterval currentToSpecifyDuration = [[[NSDate alloc] init] timeIntervalSinceDate:_startDate];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentToSpecifyDuration];
        self.stopWatchBlock(date);
    }
}

- (void)dealloc {
    NSLog(@"xxxxxx");
}

@end
