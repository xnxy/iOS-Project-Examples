//
//  Utils.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/26.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "Utils.h"

@implementation Utils

#pragma mark -
#pragma mark --- AppDelegate ---
+ (AppDelegate *)getAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark ---
#pragma mark --- 打开应用设置界面 ---
+ (void)openApplicationSettings{
    NSURL *privacyUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
        [[UIApplication sharedApplication] openURL:privacyUrl];
    }
}

+ (void)openApplicationSettingsWithUrlStr:(NSString *)urlStr{
    NSURL *privacyUrl = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
        [[UIApplication sharedApplication] openURL:privacyUrl];
    }
}

@end
