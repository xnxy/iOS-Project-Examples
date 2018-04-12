//
//  NSObject+Runtime.h
//  RuntimeDemo
//
//  Created by dev on 2018/3/22.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

@property (nonatomic, copy) NSString *name;

//获取某个实例的属性列表
+ (NSMutableArray *)propertiesInfoWithInstance:(id)instance;
//获取某个类的成员变量列表
+ (NSMutableArray *)ivarInfoWithInstance:(id)instance;
//获取某个类的方法列表
+ (NSMutableArray *)methodListWithInstance:(id)instance;
//检测对象的某个属性是否存在
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName;
//IMP指针替换系统方法
+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString;

@end
