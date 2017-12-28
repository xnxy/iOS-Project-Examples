//
//  NSString+Util.h
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Util)


- (CGSize)sizeWithFont:(UIFont *)font inSize:(CGSize)size;


/**
 正则验证是否为手机号
 
 @param mobileNum 手机号
 @return YES or NO
 */
- (BOOL)isMobileNumber;

/**
 时间戳转时间

 @param timeString 时间戳
 @param dateFormat 转换后时间格式 例如:yyyy-MM-dd HH:mm:ss
 @return 时间字符串
 */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString dateFormat:(NSString *)dateFormat;



@end
