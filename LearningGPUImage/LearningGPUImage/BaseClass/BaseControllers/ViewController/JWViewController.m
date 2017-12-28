//
//  JWViewController.m
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import "JWViewController.h"

@interface JWViewController ()

@end

@implementation JWViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.subjectForClosed       = [RACSubject subject];
        self.replaySubjectForClosed = [RACReplaySubject subject];
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.topLineIsHidden = NO;
    }
    return self;
}

#pragma mark -
#pragma mark ---
- (BOOL) hidesBottomBarWhenPushed
{
    return (self.navigationController.topViewController != self);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.navigationController.viewControllers.count > 1) {
        @weakify(self)
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"return_black"]
                                                                                    style:UIBarButtonItemStyleDone
                                                                                  handler:^(id sender)
        {
            @strongify(self)
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    UIImageView * navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = self.topLineIsHidden;
    navBarHairlineImageView.alpha = 0.6;
    navBarHairlineImageView.backgroundColor = RGB_HEX(0xe3e3e3);
}

// 找到导航栏下面的线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
