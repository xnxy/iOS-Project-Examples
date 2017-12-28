//
//  Utils.h
//  LearningGPUImage
//
//  Created by dev on 2017/12/26.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

//AppDelegate
+ (AppDelegate *)getAppDelegate;

//打开应用设置界面
+ (void)openApplicationSettings;
+ (void)openApplicationSettingsWithUrlStr:(NSString *)urlStr;

@end
