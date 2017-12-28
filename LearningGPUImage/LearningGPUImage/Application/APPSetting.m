//
//  APPSetting.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/26.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "APPSetting.h"

@implementation APPSetting

+ (APPSetting *)sharedManager{
    static dispatch_once_t predicate;
    static APPSetting * sharedManager;
    dispatch_once(&predicate, ^{
        sharedManager=[APPSetting new];
    });
    return sharedManager;
}

#pragma mark ---
#pragma mark --- 应用配置信息 ---
- (void)configureAppearance{
    //导航条颜色
    NSDictionary *navbarTitleTextAttributes = @{NSForegroundColorAttributeName:RGB_HEX(0x222222), NSFontAttributeName:[UIFont systemFontOfSize:kHeight(32)]};
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    [[UIBarButtonItem appearance] setTitleTextAttributes:navbarTitleTextAttributes forState:UIControlStateNormal];
    
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:RGB_HEX(0xfbfbfb)];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:RGB_HEX(0x222222)];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:RGB_HEX(0x222222)];
    
}

@end
