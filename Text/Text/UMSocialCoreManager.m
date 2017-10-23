//
//  UMSocialCoreManager.m
//  Text
//
//  Created by dev on 2017/9/25.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "UMSocialCoreManager.h"

@implementation UMSocialCoreManager

static UMSocialCoreManager *shareSingletion = nil;
+ (instancetype)shareInstance{
    
    if (!shareSingletion) {
        shareSingletion = [UMSocialCoreManager new];
    }
    
    return shareSingletion;
    
}

#pragma mark ---
#pragma mark --- 初始化U-Share及第三方平台 ---
- (void)start{
    
#ifdef DEBUG
    //打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
#endif
    //设置友盟appKey
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMAppKey];
    
    //第三方配置
    //微信
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
                                          appKey:WXAppId
                                       appSecret:WXAppSecret
                                     redirectURL:WXUrl];
    //qq
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
                                          appKey:QQAppId
                                       appSecret:QQAppKey
                                     redirectURL:QQUrl];
    //微博
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                          appKey:SinaAppKey
                                       appSecret:SinaSecret
                                     redirectURL:SinaUrl];
    
}

#pragma mark ---
#pragma mark --- 分享 ---
- (void)shareWithViewController:(UIViewController *)vc platformType:(UMSocialPlatformType)platformType thumImage:(UIImage *)thumImage title:(NSString *)title descr:(NSString *)descr webpageUrl:(NSString *)webpageUrl{
    
    //创建分享消息对象
    UMSocialMessageObject   *messageObject  = [UMSocialMessageObject messageObject];
    
    UMShareWebpageObject    *shareObject    = [UMShareWebpageObject shareObjectWithTitle:title
                                                                                   descr:descr
                                                                               thumImage:thumImage];
    shareObject.webpageUrl                  = webpageUrl; //设置网页地址
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject               = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id result, NSError *error) {
        
        if (error) { //失败
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{ //成功
            if ([result isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = result;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",result);
            }
        }

    }];
    
}

#pragma mark ---
#pragma mark --- 第三方登录 --- 授权并获取用户信息 ---
- (void)getAuthWithViewController:(UIViewController *)vc platformType:(UMSocialPlatformType)platformType{
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType
                                        currentViewController:vc
                                                   completion:^(id result, NSError *error)
    {
        if (error) {
            
        }else{
            
            UMSocialUserInfoResponse *resp = result;
            
            // 授权信息
            NSLog(@"Sina uid: %@", resp.uid);
            NSLog(@"Sina accessToken: %@", resp.accessToken);
            NSLog(@"Sina refreshToken: %@", resp.refreshToken);
            NSLog(@"Sina expiration: %@", resp.expiration);
            
            // 用户信息
            NSLog(@"Sina name: %@", resp.name);
            NSLog(@"Sina iconurl: %@", resp.iconurl);
            NSLog(@"Sina gender: %@", resp.unionGender);
            
            // 第三方平台SDK源数据
            NSLog(@"Sina originalResponse: %@", resp.originalResponse);
            
        }
        
    }];
    
}

#pragma mark ---
#pragma mark --- 取消授权 ---
- (void)cancleAuthWithPlatformType:(UMSocialPlatformType)platformType{
    
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:platformType
                                                  completion:^(id result, NSError *error)
    {
        
    }];
    
}

#pragma mark ---
#pragma mark --- 判断平台是否安装  YES 代表安装，NO 代表未安装 ---
- (BOOL)isInstallWithPlatformType:(UMSocialPlatformType)platformType{
    
    return [[UMSocialManager defaultManager] isInstall:platformType];
    
}

#pragma mark ---
#pragma mark --- 判断平台是否支持分享 ---
- (BOOL)isSupportSharingWithPlatformType:(UMSocialPlatformType)platformType{
    return [[UMSocialManager defaultManager] isSupport:platformType];
}

@end
