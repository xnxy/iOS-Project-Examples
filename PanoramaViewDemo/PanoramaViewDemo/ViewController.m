//
//  ViewController.m
//  PanoramaViewDemo
//
//  Created by dev on 2017/12/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *singPanoramaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [singPanoramaBtn setTitle:@"测试单个全景图" forState:UIControlStateNormal];
    [singPanoramaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    singPanoramaBtn.backgroundColor = [UIColor grayColor];
    
    UIButton *multiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [multiBtn setTitle:@"在UITableView中测试" forState:UIControlStateNormal];
    [multiBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    multiBtn.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:singPanoramaBtn];
    [self.view addSubview:multiBtn];
    
    //layout
    [singPanoramaBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.centerY).offset(-30);
    }];
    
    [multiBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.centerY).offset(30);
    }];
    
    //action
    @weakify(self)
    [[singPanoramaBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self)
         [self.navigationController pushViewController:[NSClassFromString(@"VCSinglePanoView") new] animated:YES];
     }];
    
    [[multiBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self)
         [self.navigationController pushViewController:[NSClassFromString(@"VCTablePanoView") new] animated:YES];
     }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
