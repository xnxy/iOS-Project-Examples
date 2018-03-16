//
//  NSObject+IMPChange.m
//  SafeAryAndDic
//
//  Created by dev on 2018/3/16.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSObject+IMPChange.h"
#import <objc/runtime.h>

@implementation NSObject (IMPChange)

+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString{
    //获取系统方法IMP
    Method sysMethod = class_getInstanceMethod(NSClassFromString(systemClassString), NSSelectorFromString(systemMethodString));
    //自定义方法的IMP
    Method safeMethod = class_getInstanceMethod(NSClassFromString(targetClassString), NSSelectorFromString(safeMethodString));
    //IMP相互交换，方法的实现也就互相交换了
    method_exchangeImplementations(safeMethod,sysMethod);
}

@end
