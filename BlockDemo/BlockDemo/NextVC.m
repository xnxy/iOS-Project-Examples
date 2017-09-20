//
//  NextVC.m
//  BlockDemo
//
//  Created by dev on 2017/9/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "NextVC.h"

@interface NextVC ()

@end

@implementation NextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:btn];
    
    //layout
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(100);
    }];
    
    //
    @weakify(self);
    [btn bk_whenTapped:^{
        @strongify(self);
        
        [self.navigationController popViewControllerAnimated:YES];
        
        if (self.sendMessage) {
            
            self.sendMessage(@"作为属性的block");
            
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
