//
//  UMSocialCoreManager.h
//  Text
//
//  Created by dev on 2017/9/25.
//  Copyright © 2017年 dev. All rights reserved.
//
//

static NSString *const UMAppKey     = @"56925384e0f55a7093001ac7";

//微信
static NSString *const WXAppId      = @"wxd7c78d684d30bb6e";
static NSString *const WXAppSecret  = @"54aad15fb8f1afbcb52503c634e06391";
static NSString *const WXUrl        = @"http://www.umeng.com/social";

//新浪微博
static NSString *const SinaAppKey   = @"2143949765";
static NSString *const SinaSecret   = @"202803f8d054968e6c0bfe6c03680090";
static NSString *const SinaUrl      = @"http://uda.91uda.com/mobile.php?s=/User/weiboLogin.html";

//qq
static NSString *const QQAppId      = @"101352592";
static NSString *const QQAppKey     = @"ca404546dc0f8e191bbae2183fae2ff4";
static NSString *const QQUrl        = @"http://www.umeng.com/social";

#import <Foundation/Foundation.h>

@interface UMSocialCoreManager : NSObject

+ (instancetype)shareInstance;

//初始化U-Share及第三方平台
- (void)start;
//分享
- (void)shareWithViewController:(UIViewController *)vc platformType:(UMSocialPlatformType)platformType thumImage:(UIImage *)thumImage title:(NSString *)title descr:(NSString *)descr webpageUrl:(NSString *)webpageUrl;

//第三方登录 --- 授权并获取用户信息
- (void)getAuthWithViewController:(UIViewController *)vc platformType:(UMSocialPlatformType)platformType;
//取消授权
- (void)cancleAuthWithPlatformType:(UMSocialPlatformType)platformType;
//判断平台是否安装  YES 代表安装，NO 代表未安装
- (BOOL)isInstallWithPlatformType:(UMSocialPlatformType)platformType;
//判断平台是否支持分享
- (BOOL)isSupportSharingWithPlatformType:(UMSocialPlatformType)platformType;

@end
