//
//  ViewController.m
//  RuntimeDemo
//
//  Created by dev on 2018/3/22.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Runtime.h"

@interface ViewController ()

@property (nonatomic, copy)NSString *str;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Hello world!");
    
    NSObject *object = [NSObject new];
    object.name = @"测试";
    
    NSLog(@"----:%@----",object.name);
    
    NSMutableArray *ary = [NSObject propertiesInfoWithInstance:self];
    
    NSLog(@"-----:%@-----",ary);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
