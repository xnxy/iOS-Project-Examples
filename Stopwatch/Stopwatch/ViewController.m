//
//  ViewController.m
//  Stopwatch
//
//  Created by dev on 2018/3/13.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"

#import "Timer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [UILabel new];
    label.center = self.view.center;
    label.bounds = CGRectMake(0, 0, 200, 100);
    label.backgroundColor = [UIColor orangeColor];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    
    Timer *timer = [Timer new];
    [timer start];
    
    __weak typeof(timer) weakTimer = timer;
    timer.timerBlock = ^(NSUInteger interval) {
        __strong typeof(timer) strongTimer = weakTimer;
        label.text = [NSString stringWithFormat:@"--- %lu ---",interval];
        if (interval >= 60) {
            [strongTimer stop];
        }
    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
