//
//  NSDate+Util.h
//  BeaconTower
//
//  Created by 王权伟 on 2017/7/28.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Util)


/**
 时间比较

 @param anotherDay 被比较的时间
 @return 比较结果
 */
- (int)compareWithAnotherDay:(NSDate *)anotherDay;

@end
