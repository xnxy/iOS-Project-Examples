//
//  APPSetting.h
//  LearningGPUImage
//
//  Created by dev on 2017/12/26.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPSetting : NSObject

+ (APPSetting *)sharedManager;

//配置信息
- (void)configureAppearance;

@end
