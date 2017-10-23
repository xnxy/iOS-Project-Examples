//
//  ViewController.m
//  BlockDemo
//
//  Created by dev on 2017/9/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "ViewController.h"
#import "NextVC.h"

typedef void(^Message)(NSString *str);

@interface ViewController ()

@property (nonatomic, copy) Message message;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"oyyx" ofType:@"png"];
    
    NSLog(@"----path:%@-----",path);
    
//    //初始block
//    self.message = ^(NSString *str) {
//        NSLog(@"----%@---",str);
//    };
//
//    //3s好传值
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.message(@"作为属性的Block");
//    });
    
//    [self variableBlock];
    
}

#pragma mark ---
#pragma mark --- typedef  作为属性的block ---
- (void)propertyBlock{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    //layout
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(100);
    }];
    
    //
    @weakify(self);
    [btn bk_whenTapped:^{
        @strongify(self)
        NextVC *vc = [NextVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
        vc.sendMessage = ^(NSString *str) {
            
            NSLog(@"-----str:%@----",str);
            
        };
        
    }];
    
}

#pragma mark ---
#pragma mark --- 作为方法的参数的block ---
- (void)parameterBlock{
    
    [self block:^(NSString *str01, NSString *str02) {
      
        NSLog(@"-----%@%@----",str01,str02);
        
    }];
    
}

- (void)block:(void(^)(NSString *str01, NSString *str02))block{
    
    if (block) {
        block(@"作为方法的",@"参数");
    }
    
}

#pragma mark ---
#pragma mark --- 作为变量的Block ---
- (void)variableBlock{
    
    NSInteger(^sum)(NSInteger a, NSInteger b) = ^NSInteger(NSInteger a, NSInteger b){
        return (a + b);
    };
    
    NSLog(@"-----sum:%ld----",sum(3, 5));
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
