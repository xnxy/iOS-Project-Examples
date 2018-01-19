//
//  VCSecond.m
//  SegmentView
//
//  Created by dev on 2018/1/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
}

-(void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGRect frame = self.view.superview.frame;
    self.view.mj_w = frame.size.width;
    self.view.mj_h = frame.size.height;
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
