//
//  ViewController.m
//  SafeAryAndDic
//
//  Created by dev on 2018/3/16.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *ary = @[@"0",@"1",@"2",@"3",@"4"];
    
    NSLog(@"----%@----",[ary objectAtIndex:10]);
    
    NSString *str = nil;
    [ary arrayByAddingObject:str];
    
    NSLog(@"----ary:%@----",ary);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
