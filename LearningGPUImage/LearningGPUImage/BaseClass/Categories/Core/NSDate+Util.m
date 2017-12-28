//
//  NSDate+Util.m
//  BeaconTower
//
//  Created by 王权伟 on 2017/7/28.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import "NSDate+Util.h"

@implementation NSDate (Util)

- (int)compareWithAnotherDay:(NSDate *)anotherDay {
    
    NSComparisonResult result = [self compare:anotherDay];
//    DLog(@"date1 : %@, date2 : %@", self, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
}

@end
