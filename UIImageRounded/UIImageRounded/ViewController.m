//
//  ViewController.m
//  UIImageRounded
//
//  Created by dev on 2018/3/6.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageRoundedCorner.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor blueColor];
    imageView.center = self.view.center;
    imageView.bounds = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:imageView];
    
    UIImage *image = [UIImage imageNamed:@"001"];
    
    imageView.image = [image imageAddCornerWithRadius:50 andSize:CGSizeMake(100, 100)];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
