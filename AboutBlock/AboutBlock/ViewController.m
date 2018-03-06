//
//  ViewController.m
//  AboutBlock
//
//  Created by dev on 2018/2/28.
//  Copyright © 2018年 dev. All rights reserved.
//
 
#import "ViewController.h"

typedef void(^MessageBlock)(void);

@interface ViewController ()

@property (nonatomic, copy)MessageBlock messageBlock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.messageBlock = ^{
        //防止在第二次调用的时候 weakSelf被提前释放
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf something01];
        [strongSelf something02];
    };
    
    self.messageBlock();
    
}

- (void)something01{
    NSLog(@"----123----");
}

- (void)something02{
    NSLog(@"----456----");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
