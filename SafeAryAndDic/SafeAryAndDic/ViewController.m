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
    
    NSLog(@"--------不可变数组-----------");
    
    NSArray *ary = @[@"0",@"1",@"2",@"3",@"4"];
    NSLog(@"-----%@-----",[ary objectAtIndex:10]);
    
    NSString *str = nil;
    [ary arrayByAddingObject:str];
    NSLog(@"----ary:%@----",ary);
    
    NSLog(@"--------可变数组-----------");
    
    NSMutableArray *mutableAry = [NSMutableArray array];
    NSString *str01 = nil;
    [mutableAry addObject:str01];
    
    for (NSInteger i = 0 ; i < 4; i ++) {
        [mutableAry addObject:[NSString stringWithFormat:@"object%lu",i]];
    }
    
    [mutableAry insertObject:str01 atIndex:20];
    
    [mutableAry removeLastObject];
    
    [mutableAry removeObjectAtIndex:10];
    
    [mutableAry replaceObjectAtIndex:10 withObject:@"hello world!"];
    
    NSLog(@"-----mutableAry:%@-----",mutableAry);
    
    NSLog(@"--------字典-----------");
    
    NSString *object01 = @"object01";
    NSString *object02 = @"object02";
    NSString *key01 = nil;
    NSString *key02 = @"key02";
    
    NSDictionary *dic = @{object01:key01,
                          object02:key02
                          };
    NSLog(@"------ dic: %@ ------",dic);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
